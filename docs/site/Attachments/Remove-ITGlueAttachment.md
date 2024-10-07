---
external help file: ITGlueAPI-help.xml
grand_parent: Attachments
Module Name: ITGlueAPI
online version: https://itglue.github.io/ITGlue-PowerShellWrapper/site/Attachments/Remove-ITGlueAttachment.html
parent: DELETE
schema: 2.0.0
title: Remove-ITGlueAttachment
---

# Remove-ITGlueAttachment

## SYNOPSIS
Deletes one or more specified attachments

## SYNTAX

```powershell
Remove-ITGlueAttachment [-ResourceType] <String> [-ResourceID] <Int64> [-Data] <Object> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
The Remove-ITGlueAttachment cmdlet deletes one
or more specified attachments

Examples of JSON objects can be found under ITGlues developer documentation
    https://api.itglue.com/developer

## EXAMPLES

### EXAMPLE 1
```powershell
Remove-ITGlueAttachment -ResourceType passwords -ResourceID 8675309 -Data $JsonObject
```

Using the defined JSON object this deletes an attachment from a
password with the defined id

## PARAMETERS

### -ResourceType
The resource type of the parent resource

Allowed values:
'checklists', 'checklist_templates', 'configurations', 'contacts', 'documents',
'domains', 'locations', 'passwords', 'ssl_certificates', 'flexible_assets', 'tickets'

```yaml
Type: String
Parameter Sets: (All)
Aliases: resource_type

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceID
The resource id of the parent resource

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: resource_id

Required: True
Position: 2
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
Position: 3
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

[https://itglue.github.io/ITGlue-PowerShellWrapper/site/Attachments/Remove-ITGlueAttachment.html](https://itglue.github.io/ITGlue-PowerShellWrapper/site/Attachments/Remove-ITGlueAttachment.html)

[https://api.itglue.com/developer/#attachments-bulk-destroy](https://api.itglue.com/developer/#attachments-bulk-destroy)

