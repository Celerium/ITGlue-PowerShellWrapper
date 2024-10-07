function Set-ITGlueOrganizationStatus {
<#
    .SYNOPSIS
        Updates an organization status

    .DESCRIPTION
        The Set-ITGlueOrganizationStatus cmdlet updates an organization status
        in your account

        Returns 422 Bad Request error if trying to update an externally synced record

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ID
        Update an organization status by id

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Set-ITGlueOrganizationStatus -id 8675309 -Data $JsonObject

        Using the defined body this creates an attachment to a password with the structured
        JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/OrganizationStatuses/Set-ITGlueOrganizationStatus.html

    .LINK
        https://api.itglue.com/developer/#organization-statuses-update
#>

    [CmdletBinding(DefaultParameterSetName = 'Update', SupportsShouldProcess, ConfirmImpact = 'Medium')]
    [Alias('Set-ITGlueOrganizationStatuses')]
    Param (
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

        $ResourceUri = "/organization_statuses/$ID"

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method PATCH -ResourceURI $ResourceUri -Data $Data
        }

    }

    end{}

}
