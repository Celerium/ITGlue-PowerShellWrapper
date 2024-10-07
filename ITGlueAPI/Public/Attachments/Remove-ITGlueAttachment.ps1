function Remove-ITGlueAttachment {
<#
    .SYNOPSIS
        Deletes one or more specified attachments

    .DESCRIPTION
        The Remove-ITGlueAttachment cmdlet deletes one
        or more specified attachments

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ResourceType
        The resource type of the parent resource

        Allowed values:
        'checklists', 'checklist_templates', 'configurations', 'contacts', 'documents',
        'domains', 'locations', 'passwords', 'ssl_certificates', 'flexible_assets', 'tickets'

    .PARAMETER ResourceID
        The resource id of the parent resource

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Remove-ITGlueAttachment -ResourceType passwords -ResourceID 8675309 -Data $JsonObject

        Using the defined JSON object this deletes an attachment from a
        password with the defined id

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Attachments/Remove-ITGlueAttachment.html

    .LINK
        https://api.itglue.com/developer/#attachments-bulk-destroy
#>

    [CmdletBinding(DefaultParameterSetName = 'Destroy', SupportsShouldProcess, ConfirmImpact = 'High')]
    [Alias('Remove-ITGlueAttachments')]
    Param (
        [Parameter(Mandatory = $true)]
        [Alias('resource_type')]
        [ValidateSet(   'checklists', 'checklist_templates', 'configurations', 'contacts',
                        'documents', 'domains', 'locations', 'passwords', 'ssl_certificates',
                        'flexible_assets', 'tickets'
        )]
        [string]$ResourceType,

        [Parameter(Mandatory = $true)]
        [Alias('resource_id')]
        [int64]$ResourceID,

        [Parameter(Mandatory = $true)]
        $Data
    )

    begin{

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process{

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = "/$ResourceType/$ResourceID/relationships/attachments"

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($Data)) {
            return Invoke-ITGlueRequest -Method DELETE -ResourceURI $ResourceUri -Data $Data
        }

    }

    end{}

}
