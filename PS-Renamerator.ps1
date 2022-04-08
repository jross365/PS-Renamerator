$remove = @(
	'480p',
	'1080p', 
	'1400MB', 
	'2160p', 
	'720p', 
	'800MB', 
	'AAC2[.]?0',
	'AMZN', 
	'An0mal1', 
	'bluray', 
	'\bBONE\b', 
	'chinese', 
	'ENGLISH', 
	'dolbyd',
	'\bHC\b', 
	'HDRip', 
	'HEVA', 
	'Mkvking', 
	'nickarad', 
	'NORWEGIAN',
	'Official Audio', 
	'Official Music Video', 
	'Official Video', 
	'remaster',
	'remastered in 4k', 
	'VMAX', 
	'WEB-Rip', 
	'WEBRip', 
	'[-]?GalaxyRG',
	'[Dd]?[Dd]?5\.1', 
	'[xh][\.]?26[45]', 
	'[\(\)]', 
	'[\[\]]', 
	'\+', 
	'\bus\b',
	'\bweb\b', 
	'cakes', 
	'hdtv', 
	'SYNCOPY',
	'convoy',
	'mrsk',
	'\bdl\b',
	'ettv',
	'\bre\b',
	'\bbae\b',
	'Baeeztv',
	'trollhd',
	'amazon',
	'\bdd\b',
	'Digitaldistractions',
	'Tvrip',
	'Bitsrg',
	'Pdtv',
	'xvid',
	'K4rm4',
	'2sd',
	'\bws\b',
	'\bdsr\b',
	'Omicron',
	'W4f',
	'tvt',
	'\bIht\b',
	'\bfqm\b',
	'\bsys\b',
	'from wmv',
	'Gnarly',
	'\bCtu\b',
	'Immerse',
	'Dimension',
	'\bAac\b',
	'\baup\b',
	'\btne\b',
	'Kompost',
	'\bfum\b',
	'\bCw\b',
	'\bSynhd\b',
	'\bNada\b',
	'\brbb\b',
	'\bafg\b',
	'2ch',
	'hevc',
	'\bpsa\b',
	'Megusta')


$regexArray = New-Object System.Collections.ArrayList

$remove.ForEach({$regexArray.Add([regex]$_)})

$Files = Get-ChildItem ($pwd.Path) -Recurse -File -ErrorAction SilentlyContinue | Select-Object Name,FullName

$Files.ForEach({

    $File = $_

    $FixedName = $File.Name

    $regexArray.ForEach({$FixedName = $FixedName -replace $_})

    Try {Rename-Item -Path ($File.FullName) -NewName $FixedName -ErrorAction Stop; Write-Host "Renamed $($File.Name) to $FixedName"}
    Catch {Write-Host "Unable to rename $($File.Name) to $FixedName" -ForegroundColor Red}

    })