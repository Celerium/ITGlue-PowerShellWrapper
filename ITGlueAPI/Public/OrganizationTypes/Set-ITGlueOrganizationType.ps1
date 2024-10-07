function Set-ITGlueOrganizationType {
<#
    .SYNOPSIS
        Updates an organization type

    .DESCRIPTION
        The Set-ITGlueOrganizationType cmdlet updates an organization type
        in your account

        Returns 422 Bad Request error if trying to update an externally synced record

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ID
        Update an organization type by id

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Set-ITGlueOrganizationType -id 8675309 -Data $JsonObject

        Update the defined organization type with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/OrganizationTypes/Set-ITGlueOrganizationType.html

    .LINK
        https://api.itglue.com/developer/#organization-types-update
#>

    [CmdletBinding(DefaultParameterSetName = 'Update', SupportsShouldProcess, ConfirmImpact = 'Medium')]
    [Alias('Set-ITGlueOrganizationTypes')]
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

        $ResourceUri = "/organization_types/$ID"

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method PATCH -ResourceURI $ResourceUri -Data $Data
        }

    }

    end{}
}
