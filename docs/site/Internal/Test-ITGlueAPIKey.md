---
external help file: ITGlueAPI-help.xml
grand_parent: Internal
Module Name: ITGlueAPI
online version: https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Test-ITGlueAPIKey.html
parent: GET
schema: 2.0.0
title: Test-ITGlueAPIKey
---

# Test-ITGlueAPIKey

## SYNOPSIS
Test the ITGlue API key

## SYNTAX

```powershell
Test-ITGlueAPIKey [[-BaseUri] <String>] [<CommonParameters>]
```

## DESCRIPTION
The Test-ITGlueAPIKey cmdlet tests the base URI & API key that are defined
in the Add-ITGlueBaseURI & Add-ITGlueAPIKey cmdlets

Helpful when needing to validate general functionality or when using
RMM deployment tools

The ITGlue Regions endpoint is called in this test

## EXAMPLES

### EXAMPLE 1
```powershell
Test-ITGlueApiKey
```

Tests the base URI & API key that are defined in the
Add-ITGlueBaseURI & Add-ITGlueAPIKey cmdlets

### EXAMPLE 2
```powershell
Test-ITGlueApiKey -BaseUri http://myapi.gateway.example.com
```

Tests the defined base URI & API key that was defined in
the Add-ITGlueAPIKey cmdlet

The full base uri test path in this example is:
    http://myapi.gateway.example.com/regions

## PARAMETERS

### -BaseUri
Define the base URI for the ITGlue API connection
using ITGlue's URI or a custom URI

By default the value used is the one defined by Add-ITGlueBaseURI function
    'https://api.itglue.com'

```yaml
Type: String
Parameter Sets: (All)
Aliases: base_uri

Required: False
Position: 1
Default value: $ITGlue_Base_URI
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

[https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Test-ITGlueAPIKey.html](https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Test-ITGlueAPIKey.html)

[https://github.com/Celerium/ITGlue-PowerShellWrapper](https://github.com/Celerium/ITGlue-PowerShellWrapper)

