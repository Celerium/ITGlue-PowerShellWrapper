---
external help file: ITGlueAPI-help.xml
grand_parent: Users
Module Name: ITGlueAPI
online version: https://itglue.github.io/ITGlue-PowerShellWrapper/site/Users/Set-ITGlueUser.html
parent: PATCH
schema: 2.0.0
title: Set-ITGlueUser
---

# Set-ITGlueUser

## SYNOPSIS
Updates the name or profile picture of an existing user

## SYNTAX

```powershell
Set-ITGlueUser [-ID] <Int64> [-Data] <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Set-ITGlueUser cmdlet updates the name or profile picture (avatar)
of an existing user

Examples of JSON objects can be found under ITGlues developer documentation
    https://api.itglue.com/developer

## EXAMPLES

### EXAMPLE 1
```powershell
Set-ITGlueUser -id 8675309 -Data $JsonObject
```

Updates the defined user with the specified JSON object

## PARAMETERS

### -ID
Update by user id

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
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

[https://itglue.github.io/ITGlue-PowerShellWrapper/site/Users/Set-ITGlueUser.html](https://itglue.github.io/ITGlue-PowerShellWrapper/site/Users/Set-ITGlueUser.html)

[https://api.itglue.com/developer/#accounts-users-update](https://api.itglue.com/developer/#accounts-users-update)

