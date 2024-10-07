function Set-ITGlueAttachment {
<#
    .SYNOPSIS
        Updates the details of an existing attachment

    .DESCRIPTION
        The Set-ITGlueAttachment cmdlet updates the details of
        an existing attachment

        Only the attachment name that is displayed on the asset view
        screen can be changed

        The original file_name can't be changed

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ResourceType
        The resource type of the parent resource

        Allowed values:
        'checklists', 'checklist_templates', 'configurations', 'contacts', 'documents',
        'domains', 'locations', 'passwords', 'ssl_certificates', 'flexible_assets', 'tickets'

    .PARAMETER ResourceID
        The resource id of the parent resource

    .PARAMETER ID
        The resource id of the existing attachment

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Set-ITGlueAttachment -ResourceType passwords -ResourceID 8675309 -id 8675309 -Data $JsonObject

        Updates an attachment to a password with the defined id using the structured JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Attachments/Set-ITGlueAttachment.html

    .LINK
        https://api.itglue.com/developer/#attachments-update
#>

    [CmdletBinding(DefaultParameterSetName = 'Update', SupportsShouldProcess, ConfirmImpact = 'Medium')]
    [Alias('Set-ITGlueAttachments')]
    Param (
        [Parameter(Mandatory = $true)]
        [Alias('resource_type')]
        [ValidateSet( 'checklists', 'checklist_templates', 'configurations', 'contacts', 'documents',
                'domains', 'locations', 'passwords', 'ssl_certificates', 'flexible_assets', 'tickets')]
        [string]$ResourceType,

        [Parameter(Mandatory = $true)]
        [Alias('resource_id')]
        [int64]$ResourceID,

        [Parameter(Mandatory = $true)]
        [int64]$ID,

        [Parameter(Mandatory = $true)]
        $Data
    )

    begin{

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process{

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = "/$ResourceType/$ResourceID/relationships/attachments/$ID"

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($Data)) {
            return Invoke-ITGlueRequest -Method PATCH -ResourceURI $ResourceUri -Data $Data
        }

    }

    end{}

}