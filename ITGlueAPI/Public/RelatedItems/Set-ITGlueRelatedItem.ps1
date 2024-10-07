function Set-ITGlueRelatedItem {
<#
    .SYNOPSIS
        Updates a related item for a particular resource

    .DESCRIPTION
        The Set-ITGlueRelatedItem cmdlet updates a related item for
        a particular resource

        Only the related item notes that are displayed on the
        asset view screen can be changed

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ResourceType
        The resource type of the parent resource

        Allowed values:
        'checklists', 'checklist_templates', 'configurations', 'contacts',
        'documents', 'domains', 'folders', 'locations', 'passwords', 'ssl_certificates',
        'flexible_assets', 'tickets'

    .PARAMETER ResourceID
        The resource id of the parent resource

    .PARAMETER ID
        The id of the related item

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Set-ITGlueRelatedItem -ResourceType passwords -ResourceID 8675309 -ID 8765309 -Data $JsonObject

        Updates the defined related item on the defined resource with the structured
        JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/RelatedItems/Set-ITGlueRelatedItem.html

    .LINK
        https://api.itglue.com/developer/#related-items-update
#>

    [CmdletBinding(DefaultParameterSetName = 'Update', SupportsShouldProcess, ConfirmImpact = 'Medium')]
    [Alias('Set-ITGlueRelatedItems')]
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
        [int64]$ID,

        [Parameter(Mandatory = $true)]
        $Data

    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = "/$ResourceType/$ResourceID/relationships/related_items/$ID"

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method PATCH -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}
}
