---
external help file: ITGlueAPI-help.xml
grand_parent: Internal
Module Name: ITGlueAPI
online version: https://itglue.github.io/ITGlue-PowerShellWrapper/site/Internal/Import-ITGlueModuleSetting.html
parent: GET
schema: 2.0.0
title: Import-ITGlueModuleSetting
---

# Import-ITGlueModuleSetting

## SYNOPSIS
Imports the ITGlue BaseURI, API, & JSON configuration information to the current session

## SYNTAX

```powershell
Import-ITGlueModuleSetting [[-ITGlueConfigPath] <String>] [[-ITGlueConfigFile] <String>] [<CommonParameters>]
```

## DESCRIPTION
The Import-ITGlueModuleSetting cmdlet imports the ITGlue BaseURI, API, & JSON configuration
information stored in the ITGlue configuration file to the users current session

By default the configuration file is stored in the following location:
    $env:USERPROFILE\ITGlueAPI

## EXAMPLES

### EXAMPLE 1
```powershell
Import-ITGlueModuleSetting
```

Validates that the configuration file created with the Export-ITGlueModuleSetting cmdlet exists
then imports the stored data into the current users session

The default location of the ITGlue configuration file is:
    $env:USERPROFILE\ITGlueAPI\config.psd1

### EXAMPLE 2
```powershell
Import-ITGlueModuleSetting -ITGlueConfigPath C:\ITGlueAPI -ITGlueConfigFile MyConfig.psd1
```

Validates that the configuration file created with the Export-ITGlueModuleSetting cmdlet exists
then imports the stored data into the current users session

The location of the ITGlue configuration file in this example is:
    C:\ITGlueAPI\MyConfig.psd1

## PARAMETERS

### -ITGlueConfigPath
Define the location to store the ITGlue configuration file

By default the configuration file is stored in the following location:
    $env:USERPROFILE\ITGlueAPI

```yaml
Type: String
Parameter Sets: (All)
Aliases: ITGlue_ConfigPath

Required: False
Position: 1
Default value: $(Join-Path -Path $home -ChildPath $(if ($IsWindows -or $PSEdition -eq 'Desktop') {"ITGlueAPI"}else{".ITGlueAPI"}) )
Accept pipeline input: False
Accept wildcard characters: False
```

### -ITGlueConfigFile
Define the name of the ITGlue configuration file

By default the configuration file is named:
    config.psd1

```yaml
Type: String
Parameter Sets: (All)
Aliases: ITGlue_ConfigFile

Required: False
Position: 2
Default value: Config.psd1
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
N/A

## RELATED LINKS

[https://itglue.github.io/ITGlue-PowerShellWrapper/site/Internal/Import-ITGlueModuleSetting.html](https://itglue.github.io/ITGlue-PowerShellWrapper/site/Internal/Import-ITGlueModuleSetting.html)

[https://github.com/itglue/powershellwrapper](https://github.com/itglue/powershellwrapper)

