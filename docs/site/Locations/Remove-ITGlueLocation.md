---
external help file: ITGlueAPI-help.xml
grand_parent: Locations
Module Name: ITGlueAPI
online version: https://itglue.github.io/ITGlue-PowerShellWrapper/site/Locations/Remove-ITGlueLocation.html
parent: DELETE
schema: 2.0.0
title: Remove-ITGlueLocation
---

# Remove-ITGlueLocation

## SYNOPSIS
Deletes one or more locations

## SYNTAX

### Bulk_Destroy (Default)
```powershell
Remove-ITGlueLocation [-OrganizationID <Int64>] [-ID <Int64>] [-FilterID <Int64>] [-FilterName <String>]
 [-FilterCity <String>] [-FilterRegionID <Int64>] [-FilterCountryID <Int64>] [-FilterOrganizationID <Int64>]
 [-FilterPsaIntegrationType <String>] -Data <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Bulk_Destroy_PSA
```powershell
Remove-ITGlueLocation [-OrganizationID <Int64>] [-ID <Int64>] [-FilterID <Int64>] [-FilterName <String>]
 [-FilterCity <String>] [-FilterRegionID <Int64>] [-FilterCountryID <Int64>] [-FilterOrganizationID <Int64>]
 [-FilterPsaID <String>] -FilterPsaIntegrationType <String> -Data <Object> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
The Set-ITGlueLocation cmdlet deletes one or more
specified locations

Examples of JSON objects can be found under ITGlues developer documentation
    https://api.itglue.com/developer

## EXAMPLES

### EXAMPLE 1
```powershell
Remove-ITGlueLocation -OrganizationID 123456 -ID 8765309 -Data $JsonObject
```

Removes the defined location from the defined organization with the specified JSON object

### EXAMPLE 2
```powershell
Remove-ITGlueLocation -Data $JsonObject
```

Removes location(s) with the specified JSON object

## PARAMETERS

### -OrganizationID
The valid organization id in your account

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: org_id, organization_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ID
Location id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterID
Filter by a location id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: filter_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterName
Filter by a location name

```yaml
Type: String
Parameter Sets: (All)
Aliases: filter_name

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterCity
Filter by a location city

```yaml
Type: String
Parameter Sets: (All)
Aliases: filter_city

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterRegionID
Filter by a location region id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: filter_region_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterCountryID
Filter by a location country id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: filter_country_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterOrganizationID
Filter by an organization ID

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: filter_organization_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterPsaID
Filter by a psa integration id

```yaml
Type: String
Parameter Sets: Bulk_Destroy_PSA
Aliases: filter_psa_id

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterPsaIntegrationType
Filter by a psa integration type

Allowed values:
'manage', 'autotask', 'tigerpaw', 'kaseya-bms', 'pulseway-psa', 'vorex'

```yaml
Type: String
Parameter Sets: Bulk_Destroy
Aliases: filter_psa_integration_type

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: Bulk_Destroy_PSA
Aliases: filter_psa_integration_type

Required: True
Position: Named
Default value: None
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

[https://itglue.github.io/ITGlue-PowerShellWrapper/site/Locations/Remove-ITGlueLocation.html](https://itglue.github.io/ITGlue-PowerShellWrapper/site/Locations/Remove-ITGlueLocation.html)

[https://api.itglue.com/developer/#locations-bulk-destroy](https://api.itglue.com/developer/#locations-bulk-destroy)

