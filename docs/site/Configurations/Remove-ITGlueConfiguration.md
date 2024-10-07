---
external help file: ITGlueAPI-help.xml
grand_parent: Configurations
Module Name: ITGlueAPI
online version: https://itglue.github.io/ITGlue-PowerShellWrapper/site/Configurations/Remove-ITGlueConfiguration.html
parent: DELETE
schema: 2.0.0
title: Remove-ITGlueConfiguration
---

# Remove-ITGlueConfiguration

## SYNOPSIS
Deletes one or more configurations

## SYNTAX

### Bulk_Destroy (Default)
```powershell
Remove-ITGlueConfiguration -Data <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Destroy
```powershell
Remove-ITGlueConfiguration -ID <Int64> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Bulk_Destroy_RMM_PSA
```powershell
Remove-ITGlueConfiguration [-FilterID <Int64>] [-FilterName <String>] [-FilterOrganizationID <Int64>]
 [-FilterConfigurationTypeID <Int64>] [-FilterConfigurationStatusID <Int64>] [-FilterContactID <Int64>]
 [-FilterSerialNumber <String>] [-FilterMacAddress <String>] [-FilterAssetTag <String>] [-FilterPsaID <String>]
 -FilterPsaIntegrationType <String> [-FilterRmmID <String>] -FilterRmmIntegrationType <String>
 [-FilterArchived <String>] -Data <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Bulk_Destroy_PSA
```powershell
Remove-ITGlueConfiguration [-FilterID <Int64>] [-FilterName <String>] [-FilterOrganizationID <Int64>]
 [-FilterConfigurationTypeID <Int64>] [-FilterConfigurationStatusID <Int64>] [-FilterContactID <Int64>]
 [-FilterSerialNumber <String>] [-FilterMacAddress <String>] [-FilterAssetTag <String>] [-FilterPsaID <String>]
 -FilterPsaIntegrationType <String> [-FilterRmmIntegrationType <String>] [-FilterArchived <String>]
 -Data <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Bulk_Destroy_RMM
```powershell
Remove-ITGlueConfiguration [-FilterID <Int64>] [-FilterName <String>] [-FilterOrganizationID <Int64>]
 [-FilterConfigurationTypeID <Int64>] [-FilterConfigurationStatusID <Int64>] [-FilterContactID <Int64>]
 [-FilterSerialNumber <String>] [-FilterMacAddress <String>] [-FilterAssetTag <String>]
 [-FilterPsaIntegrationType <String>] [-FilterRmmID <String>] -FilterRmmIntegrationType <String>
 [-FilterArchived <String>] -Data <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Remove-ITGlueConfiguration cmdlet deletes one or
more specified configurations

Examples of JSON objects can be found under ITGlues developer documentation
    https://api.itglue.com/developer

## EXAMPLES

### EXAMPLE 1
```powershell
Remove-ITGlueConfiguration -ID 8765309 -Data $JsonObject
```

Deletes a defined configuration with the specified JSON object

## PARAMETERS

### -ID
A valid configuration Id

```yaml
Type: Int64
Parameter Sets: Destroy
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterID
Filter by configuration id

```yaml
Type: Int64
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA, Bulk_Destroy_RMM
Aliases: filter_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterName
Filter by configuration name

```yaml
Type: String
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA, Bulk_Destroy_RMM
Aliases: filter_name

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterOrganizationID
Filter by organization name

```yaml
Type: Int64
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA, Bulk_Destroy_RMM
Aliases: filter_organization_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterConfigurationTypeID
Filter by configuration type id

```yaml
Type: Int64
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA, Bulk_Destroy_RMM
Aliases: filter_configuration_type_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterConfigurationStatusID
Filter by configuration status id

```yaml
Type: Int64
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA, Bulk_Destroy_RMM
Aliases: filter_configuration_status_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterContactID
Filter by contact id

```yaml
Type: Int64
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA, Bulk_Destroy_RMM
Aliases: filter_contact_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterSerialNumber
Filter by a configurations serial number

```yaml
Type: String
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA, Bulk_Destroy_RMM
Aliases: filter_serial_number

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterMacAddress
Filter by a configurations mac address

```yaml
Type: String
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA, Bulk_Destroy_RMM
Aliases: filter_mac_address

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterAssetTag
Filter by a configurations asset tag

```yaml
Type: String
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA, Bulk_Destroy_RMM
Aliases: filter_asset_tag

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterPsaID
Filter by a PSA id

```yaml
Type: String
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA
Aliases: filter_psa_id

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterPsaIntegrationType
Filter by a PSA integration type

Allowed values:
'manage', 'autotask', 'tigerpaw', 'kaseya-bms', 'pulseway-psa', 'vorex'

```yaml
Type: String
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA
Aliases: filter_psa_integration_type

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: Bulk_Destroy_RMM
Aliases: filter_psa_integration_type

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterRmmID
Filter by a RMM id

```yaml
Type: String
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_RMM
Aliases: filter_rmm_id

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterRmmIntegrationType
Filter by a RMM integration type

Allowed values:
'addigy', 'aem', 'atera', 'auvik', 'managed-workplace',
'continuum', 'jamf-pro', 'kaseya-vsa', 'automate', 'log-me-in',
'msp-rmm', 'meraki', 'msp-n-central', 'ninja-rmm', 'panorama9',
'pulseway-rmm', 'syncro', 'watchman-monitoring','office365','vsa-x'

```yaml
Type: String
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_RMM
Aliases: filter_rmm_integration_type

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: Bulk_Destroy_PSA
Aliases: filter_rmm_integration_type

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterArchived
Filter for archived

Allowed values: (case-sensitive)
'true', 'false', '0', '1'

```yaml
Type: String
Parameter Sets: Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA, Bulk_Destroy_RMM
Aliases: filter_archived

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Data
JSON object or array depending on bulk changes or not

```yaml
Type: Object
Parameter Sets: Bulk_Destroy, Bulk_Destroy_RMM_PSA, Bulk_Destroy_PSA, Bulk_Destroy_RMM
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

[https://itglue.github.io/ITGlue-PowerShellWrapper/site/Configurations/Remove-ITGlueConfiguration.html](https://itglue.github.io/ITGlue-PowerShellWrapper/site/Configurations/Remove-ITGlueConfiguration.html)

[https://api.itglue.com/developer/#configurations-bulk-destroy](https://api.itglue.com/developer/#configurations-bulk-destroy)

