function New-ITGlueAttachment {
<#
    .SYNOPSIS
        Adds an attachment to one or more assets

    .DESCRIPTION
        The New-ITGlueAttachment cmdlet adds an attachment
        to one or more assets

        Attachments are uploaded by including media data on the asset the attachment
        is associated with. Attachments can be encoded and passed in JSON format for
        direct upload, in which case the file has to be strict encoded

        Note that the name of the attachment will be taken from the file_name attribute
        placed in the JSON body

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
        New-ITGlueAttachment -ResourceType passwords -ResourceID 8675309 -Data $JsonObject

        Creates an attachment to a password with the defined id using the structured JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Attachments/New-ITGlueAttachment.html

    .LINK
        https://api.itglue.com/developer/#attachments-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueAttachments')]
    Param (
        [Parameter(Mandatory = $true)]
        [Alias('resource_type')]
        [ValidateSet(   'checklists', 'checklist_templates', 'configurations', 'contacts',
                        'documents','domains', 'locations', 'passwords', 'ssl_certificates',
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
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data
        }

    }

    end{}

}