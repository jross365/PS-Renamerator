function Rename-MediaFiles ($TermsFile,$Path,[switch]$WhatIf){

If ($null -eq $TermsFile -or $TermsFile.Length -eq 0){$TermsFile = "matchterms.json"}

If ($null -eq $Path -or $Path.Length -eq 0){$Path = (Get-Location).Path}
Else {If(!Test-Path $Path){throw "$Path doesn't appear to be valid"}}

try {$remove = Get-ChildItem "matchterms.json" -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop}
Catch {throw "unable to import matchterms.json"}

$regexArray = New-Object System.Collections.ArrayList

$remove.ForEach({$regexArray.Add([regex]$_)})

Try {$Files = Get-ChildItem $Path -Recurse -File -ErrorAction Stop | Select-Object Name,FullName}
catch {}

$Files.ForEach({

    $File = $_

    $FixedName = $File.Name

    $regexArray.ForEach({$FixedName = $FixedName -replace $_})

	Switch ($WhatIf.IsPresent){

	$True {Rename-Item -Path ($File.FullName) -NewName $FixedName -WhatIf}
	
	$False {

		Try {Rename-Item -Path ($File.FullName) -NewName $FixedName -ErrorAction Stop; Write-Host "Renamed $($File.Name) to $FixedName"}
		Catch {Write-Host "Unable to rename $($File.Name) to $FixedName" -ForegroundColor Red}

	}

	}

    })

}