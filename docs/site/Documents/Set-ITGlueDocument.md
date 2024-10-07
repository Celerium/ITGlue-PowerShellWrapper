---
external help file: ITGlueAPI-help.xml
grand_parent: Documents
Module Name: ITGlueAPI
online version: https://itglue.github.io/ITGlue-PowerShellWrapper/site/Documents/Set-ITGlueDocument.html
parent: PATCH
schema: 2.0.0
title: Set-ITGlueDocument
---

# Set-ITGlueDocument

## SYNOPSIS
Updates one or more documents

## SYNTAX

### Bulk_Update (Default)
```powershell
Set-ITGlueDocument [-OrganizationID <Int64>] -Data <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Update
```powershell
Set-ITGlueDocument [-OrganizationID <Int64>] -ID <Int64> -Data <Object> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
The Set-ITGlueDocument cmdlet updates one or more existing documents

Any attributes you don't specify will remain unchanged

This function can call the following endpoints:
    Update =    /documents/:id
                /organizations/:organization_id/relationships/documents/:id

    Bulk_Update =  /documents

Examples of JSON objects can be found under ITGlues developer documentation
    https://api.itglue.com/developer

## EXAMPLES

### EXAMPLE 1
```powershell
Set-ITGlueDocument -id 8675309 -Data $JsonObject
```

Updates the defined document with the specified JSON object

## PARAMETERS

### -OrganizationID
A valid organization Id in your Account

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
The document id to update

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

[https://itglue.github.io/ITGlue-PowerShellWrapper/site/Documents/Set-ITGlueDocument.html](https://itglue.github.io/ITGlue-PowerShellWrapper/site/Documents/Set-ITGlueDocument.html)

[https://api.itglue.com/developer/#documents-update](https://api.itglue.com/developer/#documents-update)

