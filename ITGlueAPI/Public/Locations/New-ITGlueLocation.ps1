function New-ITGlueLocation {
<#
    .SYNOPSIS
        Creates one or more locations

    .DESCRIPTION
        The New-ITGlueLocation cmdlet creates one or more
        locations for specified organization

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER OrganizationID
        The valid organization id in your account

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGlueLocation -$OrganizationID 8675309 -Data $JsonObject

        Creates a new location under the defined organization with the structured
        JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Locations/New-ITGlueLocation.html

    .LINK
        https://api.itglue.com/developer/#locations-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueLocations')]
    Param (
        [Parameter(Mandatory = $true)]
        [Alias('org_id','organization_id')]
        [int64]$OrganizationID,

        [Parameter(Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ([bool]$OrganizationID) {
            $true   { $ResourceUri = "/organizations/$OrganizationID/relationships/locations" }
            $false  { $ResourceUri = "/locations" }
        }

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
