function Remove-ITGlueRelatedItem {
<#
    .SYNOPSIS
        Deletes one or more related items

    .DESCRIPTION
        The Remove-ITGlueRelatedItem cmdlet deletes one or more specified
        related items

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ResourceType
        The resource type of the parent resource

        Allowed values:
        'checklists', 'checklist_templates', 'configurations', 'contacts',
        'documents', 'domains', 'folders', 'locations', 'passwords', 'ssl_certificates',
        'flexible_assets', 'tickets'

    .PARAMETER ResourceID
        The id of the related item

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Remove-ITGlueRelatedItem -ResourceType passwords -ResourceID 8675309 -Data $JsonObject

        Deletes the defined related item on the defined resource with the structured
        JSON object

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/RelatedItems/Remove-ITGlueRelatedItem.html

    .LINK
        https://api.itglue.com/developer/#related-items-bulk-destroy
#>

    [CmdletBinding(DefaultParameterSetName = 'Destroy', SupportsShouldProcess, ConfirmImpact = 'High')]
    [Alias('Remove-ITGlueRelatedItems')]
    Param (
        [Parameter(Mandatory = $true)]
        [ValidateSet(   'checklists', 'checklist_templates', 'configurations', 'contacts',
                        'documents', 'domains','folders', 'locations', 'passwords', 'ssl_certificates',
                        'flexible_assets', 'tickets')]
        [Alias('resource_type')]
        [string]$ResourceType,

        [Parameter(Mandatory = $true)]
        [Alias('resource_id')]
        [int64]$ResourceID,

        [Parameter(Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = "/$ResourceType/$ResourceID/relationships/related_items"

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method DELETE -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
