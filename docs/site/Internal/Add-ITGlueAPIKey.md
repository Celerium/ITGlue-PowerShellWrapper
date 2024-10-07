---
external help file: ITGlueAPI-help.xml
grand_parent: Internal
Module Name: ITGlueAPI
online version: https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Add-ITGlueAPIKey.html
parent: POST
schema: 2.0.0
title: Add-ITGlueAPIKey
---

# Add-ITGlueAPIKey

## SYNOPSIS
Sets your API key used to authenticate all API calls

## SYNTAX

```powershell
Add-ITGlueAPIKey [[-ApiKey] <String>] [<CommonParameters>]
```

## DESCRIPTION
The Add-ITGlueAPIKey cmdlet sets your API key which is used to
authenticate all API calls made to ITGlue

ITGlue API keys can be generated via the ITGlue web interface
    Account \> API Keys

## EXAMPLES

### EXAMPLE 1
```powershell
Add-ITGlueAPIKey
```

Prompts to enter in the API key

### EXAMPLE 2
```powershell
Add-ITGlueAPIKey -ApiKey 'some_api_key'
```

Will use the string entered into the \[ -ApiKey \] parameter

### EXAMPLE 3
```
'12345' | Add-ITGlueAPIKey
```

Will use the string passed into it as its API key

## PARAMETERS

### -ApiKey
Defines the API key that was generated from ITGlue

```yaml
Type: String
Parameter Sets: (All)
Aliases: Api_Key

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
N/A

## RELATED LINKS

[https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Add-ITGlueAPIKey.html](https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Add-ITGlueAPIKey.html)

[https://github.com/itglue/powershellwrapper](https://github.com/itglue/powershellwrapper)

