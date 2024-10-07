---
external help file: ITGlueAPI-help.xml
grand_parent: Configurations
Module Name: ITGlueAPI
online version: https://itglue.github.io/ITGlue-PowerShellWrapper/site/Configurations/New-ITGlueConfiguration.html
parent: POST
schema: 2.0.0
title: New-ITGlueConfiguration
---

# New-ITGlueConfiguration

## SYNOPSIS
Creates one or more configurations

## SYNTAX

```powershell
New-ITGlueConfiguration [[-OrganizationID] <Int64>] [-Data] <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The New-ITGlueConfiguration cmdlet creates one or more
configurations under a defined organization

Examples of JSON objects can be found under ITGlues developer documentation
    https://api.itglue.com/developer

## EXAMPLES

### EXAMPLE 1
```powershell
New-ITGlueConfiguration -OrganizationID 8675309 -Data $JsonObject
```

Creates a configuration in the defined organization with the
with the specified JSON object

## PARAMETERS

### -OrganizationID
A valid organization Id in your Account

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: org_id, organization_id

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

[https://itglue.github.io/ITGlue-PowerShellWrapper/site/Configurations/new-ITGlueConfiguration.html](https://itglue.github.io/ITGlue-PowerShellWrapper/site/Configurations/new-ITGlueConfiguration.html)

[https://api.itglue.com/developer/#configurations-create](https://api.itglue.com/developer/#configurations-create)

