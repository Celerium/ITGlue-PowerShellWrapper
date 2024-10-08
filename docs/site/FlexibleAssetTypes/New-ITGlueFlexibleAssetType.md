---
external help file: ITGlueAPI-help.xml
grand_parent: FlexibleAssetTypes
Module Name: ITGlueAPI
online version: https://celerium.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetTypes/New-ITGlueFlexibleAssetType.html
parent: POST
schema: 2.0.0
title: New-ITGlueFlexibleAssetType
---

# New-ITGlueFlexibleAssetType

## SYNOPSIS
Creates one or more flexible asset types

## SYNTAX

```powershell
New-ITGlueFlexibleAssetType [-Data] <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The New-ITGlueFlexibleAssetType cmdlet creates one or
more flexible asset types

Examples of JSON objects can be found under ITGlues developer documentation
    https://api.itglue.com/developer

## EXAMPLES

### EXAMPLE 1
```powershell
New-ITGlueFlexibleAssetType -Data $JsonObject
```

Creates a new flexible asset type with the specified JSON object

## PARAMETERS

### -Data
JSON object or array depending on bulk changes or not

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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

[https://celerium.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetTypes/New-ITGlueFlexibleAssetType.html](https://celerium.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetTypes/New-ITGlueFlexibleAssetType.html)

[https://api.itglue.com/developer/#flexible-asset-types-create](https://api.itglue.com/developer/#flexible-asset-types-create)

