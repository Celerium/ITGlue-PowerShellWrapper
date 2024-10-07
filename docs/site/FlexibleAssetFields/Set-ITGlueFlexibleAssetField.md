---
external help file: ITGlueAPI-help.xml
grand_parent: FlexibleAssetFields
Module Name: ITGlueAPI
online version: https://itglue.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetFields/Set-ITGlueFlexibleAssetField.html
parent: PATCH
schema: 2.0.0
title: Set-ITGlueFlexibleAssetField
---

# Set-ITGlueFlexibleAssetField

## SYNOPSIS
Updates one or more flexible asset fields

## SYNTAX

### Bulk_Update (Default)
```powershell
Set-ITGlueFlexibleAssetField [-FilterID <Int64>] -Data <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Update
```powershell
Set-ITGlueFlexibleAssetField [-FlexibleAssetTypeID <Int64>] -ID <Int64> -Data <Object> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
The Set-ITGlueFlexibleAssetField cmdlet updates the details of one
or more existing flexible asset fields

Any attributes you don't specify will remain unchanged

Can also be used to bulk update flexible asset fields

Returns 422 error if trying to change the kind attribute of fields that
are already in use

Examples of JSON objects can be found under ITGlues developer documentation
    https://api.itglue.com/developer

## EXAMPLES

### EXAMPLE 1
```powershell
Set-ITGlueFlexibleAssetField -id 8675309 -Data $JsonObject
```

Updates a defined flexible asset field with the structured
JSON object

## PARAMETERS

### -FlexibleAssetTypeID
A valid Flexible asset Id in your Account

```yaml
Type: Int64
Parameter Sets: Update
Aliases: flexible_asset_type_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ID
Id of a flexible asset field

```yaml
Type: Int64
Parameter Sets: Update
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterID
Filter by a flexible asset field id

```yaml
Type: Int64
Parameter Sets: Bulk_Update
Aliases: filter_id

Required: False
Position: Named
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
Position: Named
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

[https://itglue.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetFields/Set-ITGlueFlexibleAssetField.html](https://itglue.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetFields/Set-ITGlueFlexibleAssetField.html)

[https://api.itglue.com/developer/#flexible-asset-fields-update](https://api.itglue.com/developer/#flexible-asset-fields-update)

