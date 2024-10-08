---
external help file: ITGlueAPI-help.xml
grand_parent: Internal
Module Name: ITGlueAPI
online version: https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Get-ITGlueModuleSetting.html
parent: GET
schema: 2.0.0
title: Get-ITGlueModuleSetting
---

# Get-ITGlueModuleSetting

## SYNOPSIS
Gets the saved ITGlue configuration settings

## SYNTAX

```powershell
Get-ITGlueModuleSetting [[-ITGlueConfigPath] <String>] [[-ITGlueConfigFile] <String>] [-OpenConfigFile]
 [<CommonParameters>]
```

## DESCRIPTION
The Get-ITGlueModuleSetting cmdlet gets the saved ITGlue configuration settings
from the local system

By default the configuration file is stored in the following location:
    $env:USERPROFILE\ITGlueAPI

## EXAMPLES

### EXAMPLE 1
```powershell
Get-ITGlueModuleSetting
```

Gets the contents of the configuration file that was created with the
Export-ITGlueModuleSetting

The default location of the ITGlue configuration file is:
    $env:USERPROFILE\ITGlueAPI\config.psd1

### EXAMPLE 2
```powershell
Get-ITGlueModuleSetting -ITGlueConfigPath C:\ITGlueAPI -ITGlueConfigFile MyConfig.psd1 -openConfFile
```

Opens the configuration file from the defined location in the default editor

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

### -OpenConfigFile
Opens the ITGlue configuration file

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: Open_ConfigFile

Required: False
Position: Named
Default value: False
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

[https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Get-ITGlueModuleSetting.html](https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Get-ITGlueModuleSetting.html)

[https://github.com/Celerium/ITGlue-PowerShellWrapper](https://github.com/Celerium/ITGlue-PowerShellWrapper)

