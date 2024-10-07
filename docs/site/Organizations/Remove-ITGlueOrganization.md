---
external help file: ITGlueAPI-help.xml
grand_parent: Organizations
Module Name: ITGlueAPI
online version: https://itglue.github.io/ITGlue-PowerShellWrapper/site/Organizations/Remove-ITGlueOrganization.html
parent: DELETE
schema: 2.0.0
title: Remove-ITGlueOrganization
---

# Remove-ITGlueOrganization

## SYNOPSIS
Deletes one or more organizations

## SYNTAX

### Bulk_Destroy (Default)
```powershell
Remove-ITGlueOrganization [-FilterID <Int64>] [-FilterName <String>] [-FilterOrganizationTypeID <Int64>]
 [-FilterOrganizationStatusID <Int64>] [-FilterCreatedAt <String>] [-FilterUpdatedAt <String>]
 [-FilterMyGlueAccountID <Int64>] [-FilterPsaIntegrationType <String>] [-FilterGroupID <Int64>]
 [-FilterPrimary <String>] [-FilterExcludeID <Int64>] [-FilterExcludeName <String>]
 [-FilterExcludeOrganizationTypeID <Int64>] [-FilterExcludeOrganizationStatusID <Int64>] -Data <Object>
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Bulk_Destroy_PSA
```powershell
Remove-ITGlueOrganization [-FilterID <Int64>] [-FilterName <String>] [-FilterOrganizationTypeID <Int64>]
 [-FilterOrganizationStatusID <Int64>] [-FilterCreatedAt <String>] [-FilterUpdatedAt <String>]
 [-FilterMyGlueAccountID <Int64>] [-FilterPsaID <String>] -FilterPsaIntegrationType <String>
 [-FilterGroupID <Int64>] [-FilterPrimary <String>] [-FilterExcludeID <Int64>] [-FilterExcludeName <String>]
 [-FilterExcludeOrganizationTypeID <Int64>] [-FilterExcludeOrganizationStatusID <Int64>] -Data <Object>
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Remove-ITGlueOrganization cmdlet marks organizations identified by the
specified organization IDs for deletion

Because it can be a long procedure to delete organizations,
removal from the system may not happen immediately

Examples of JSON objects can be found under ITGlues developer documentation
    https://api.itglue.com/developer

## EXAMPLES

### EXAMPLE 1
```powershell
Remove-ITGlueOrganization -Data $JsonObject
```

Deletes all defined organization with the specified JSON object

## PARAMETERS

### -FilterID
Filter by an organization id

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
Filter by an organization name

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

### -FilterOrganizationTypeID
Filter by an organization type id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: filter_organization_type_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterOrganizationStatusID
Filter by an organization status id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: filter_organization_status_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterCreatedAt
Filter by when an organization created

```yaml
Type: String
Parameter Sets: (All)
Aliases: filter_created_at

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterUpdatedAt
Filter by when an organization updated

```yaml
Type: String
Parameter Sets: (All)
Aliases: filter_updated_at

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterMyGlueAccountID
Filter by a MyGlue id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: filter_my_glue_account_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterPsaID
Filter by a PSA id

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
Filter by a PSA integration type

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

### -FilterGroupID
Filter by a group id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: filter_group_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterPrimary
Filter for primary organization

Allowed values:
'true', 'false'

```yaml
Type: String
Parameter Sets: (All)
Aliases: filter_primary

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterExcludeID
Filter to excluded a certain organization id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: filter_exclude_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterExcludeName
Filter to excluded a certain organization name

```yaml
Type: String
Parameter Sets: (All)
Aliases: filter_exclude_name

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterExcludeOrganizationTypeID
Filter to excluded a certain organization type id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: filter_exclude_organization_type_id

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterExcludeOrganizationStatusID
Filter to excluded a certain organization status id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: filter_exclude_organization_status_id

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

[https://itglue.github.io/ITGlue-PowerShellWrapper/site/Organizations/Remove-ITGlueOrganization.html](https://itglue.github.io/ITGlue-PowerShellWrapper/site/Organizations/Remove-ITGlueOrganization.html)

[https://api.itglue.com/developer/#organizations-bulk-destroy](https://api.itglue.com/developer/#organizations-bulk-destroy)

