---
external help file: ITGlueAPI-help.xml
grand_parent: Internal
Module Name: ITGlueAPI
online version: https://itglue.github.io/ITGlue-PowerShellWrapper/site/Internal/ConvertTo-ITGlueQueryString.html
parent: PUT
schema: 2.0.0
title: ConvertTo-ITGlueQueryString
---

# ConvertTo-ITGlueQueryString

## SYNOPSIS
Converts uri filter parameters

## SYNTAX

```powershell
ConvertTo-ITGlueQueryString [-QueryParams] <Hashtable> [<CommonParameters>]
```

## DESCRIPTION
The ConvertTo-ITGlueQueryString cmdlet converts & formats uri query parameters
from a function which are later used to make the full resource uri for
an API call

This is an internal helper function the ties in directly with the
Invoke-ITGlueRequest & any public functions that define parameters

## EXAMPLES

### EXAMPLE 1
```powershell
ConvertTo-ITGlueQueryString -QueryParams $HashTable
```

Example HashTable:
    $query_params = @{
        'filter\[id\]'\]               = 123456789
        'filter\[organization_id\]'\]  = 12345
    }

## PARAMETERS

### -QueryParams
Hashtable of values to combine a functions parameters with
the ResourceUri parameter

This allows for the full uri query to occur

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
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

[https://itglue.github.io/ITGlue-PowerShellWrapper/site/Internal/ConvertTo-ITGlueQueryString.html](https://itglue.github.io/ITGlue-PowerShellWrapper/site/Internal/ConvertTo-ITGlueQueryString.html)

[https://github.com/itglue/powershellwrapper](https://github.com/itglue/powershellwrapper)

