# Rename-MediaFiles

A simple Powershell function to rename media files.

## Description

The Rename-MediaFiles function cleans up and renames media files with atypical/incorrect names.

## Getting Started

### Dependencies
* A Microsoft Windows operating system (Recommend Windows 7 or greater, Windows Server 2008 or greater)
* Windows Powershell (5.1+ recommended)


### Installing
This script can be copied and run from any location, and has no installation prerequisites or path requirements.

### Executing program

Running the script is simple:

* Import the function:
```
. .\Rename-MediaFiles.ps1
```

* Run the function (example stores results in $RouteResults variable):
```
Rename-MediaFiles -Path <Directory Path>
```

* This function also supports -WhatIf:
```
Rename-MediaFiles -Path <Directory Path> -WhatIf
```


## Help

I've never run this script, and the script logic was written around a BASH script a friend sent me.

If you run into any problems with it, let me know and I will correct it.
```

## Authors

I am the author.

## Version History

* 1.0 - Initial version.
    * It just works.

## License

This project is licensed under the GNUv3 License - see the LICENSE.md file for details.
