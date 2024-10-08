---
external help file: ITGlueAPI-help.xml
grand_parent: FlexibleAssetFields
Module Name: ITGlueAPI
online version: https://celerium.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetFields/New-ITGlueFlexibleAssetField.html
parent: POST
schema: 2.0.0
title: New-ITGlueFlexibleAssetField
---

# New-ITGlueFlexibleAssetField

## SYNOPSIS
Creates one or more flexible asset fields

## SYNTAX

```powershell
New-ITGlueFlexibleAssetField [[-FlexibleAssetTypeID] <Int64>] [-Data] <Object> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
The New-ITGlueFlexibleAssetField cmdlet creates one or more
flexible asset field for a particular flexible asset type

Examples of JSON objects can be found under ITGlues developer documentation
    https://api.itglue.com/developer

## EXAMPLES

### EXAMPLE 1
```powershell
New-ITGlueFlexibleAssetField -FlexibleAssetTypeID 8675309 -Data $JsonObject
```

Creates a new flexible asset field for the defined id with the structured
JSON object

## PARAMETERS

### -FlexibleAssetTypeID
The flexible asset type id to create a new field in

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: flexible_asset_type_id

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Data
JSON object or array depending on bulk changes or not

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

[https://celerium.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetFields/New-ITGlueFlexibleAssetField.html](https://celerium.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetFields/New-ITGlueFlexibleAssetField.html)

[https://api.itglue.com/developer/#flexible-asset-fields-create](https://api.itglue.com/developer/#flexible-asset-fields-create)

