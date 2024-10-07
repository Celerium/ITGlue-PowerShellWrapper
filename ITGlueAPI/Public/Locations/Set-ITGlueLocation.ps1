function Set-ITGlueLocation {
<#
    .SYNOPSIS
        Updates one or more a locations

    .DESCRIPTION
        The Set-ITGlueLocation cmdlet updates the details of
        an existing location or locations

        Any attributes you don't specify will remain unchanged

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ID
        Get a location by id

    .PARAMETER OrganizationID
        The valid organization id in your account

    .PARAMETER FilterID
        Filter by a location id

    .PARAMETER FilterName
        Filter by a location name

    .PARAMETER FilterCity
        Filter by a location city

    .PARAMETER FilterRegionID
        Filter by a location region id

    .PARAMETER FilterCountryID
        Filter by a location country id

    .PARAMETER FilterOrganizationID
        Filter by an organization ID

    .PARAMETER FilterPsaID
        Filter by a psa integration id

    .PARAMETER FilterPsaIntegrationType
        Filter by a psa integration type

        Allowed values:
        'manage', 'autotask', 'tigerpaw', 'kaseya-bms', 'pulseway-psa', 'vorex'

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Set-ITGlueLocation -id 8765309 -Data $JsonObject

        Updates the defined location with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Locations/Set-ITGlueLocation.html

    .LINK
        https://api.itglue.com/developer/#locations-update
#>

    [CmdletBinding(DefaultParameterSetName = 'Bulk_Update', SupportsShouldProcess, ConfirmImpact = 'Medium')]
    [Alias('Set-ITGlueLocations')]
    Param (
        [Parameter(ParameterSetName = 'Update', Mandatory = $true)]
        [int64]$ID,

        [Parameter(ParameterSetName = 'Update')]
        [Alias('org_id','organization_id')]
        [int64]$OrganizationID,

        [Parameter(ParameterSetName = 'Bulk_Update')]
        [Parameter(ParameterSetName = 'Bulk_Update_PSA')]
        [Alias('filter_id')]
        [int64]$FilterID,

        [Parameter(ParameterSetName = 'Bulk_Update')]
        [Parameter(ParameterSetName = 'Bulk_Update_PSA')]
        [Alias('filter_name')]
        [string]$FilterName,

        [Parameter(ParameterSetName = 'Bulk_Update')]
        [Parameter(ParameterSetName = 'Bulk_Update_PSA')]
        [Alias('filter_city')]
        [string]$FilterCity,

        [Parameter(ParameterSetName = 'Bulk_Update')]
        [Parameter(ParameterSetName = 'Bulk_Update_PSA')]
        [Alias('filter_region_id')]
        [int64]$FilterRegionID,

        [Parameter(ParameterSetName = 'Bulk_Update')]
        [Parameter(ParameterSetName = 'Bulk_Update_PSA')]
        [Alias('filter_country_id')]
        [int64]$FilterCountryID,

        [Parameter(ParameterSetName = 'Bulk_Update')]
        [Parameter(ParameterSetName = 'Bulk_Update_PSA')]
        [Alias('filter_organization_id')]
        [int64]$FilterOrganizationID,

        [Parameter(ParameterSetName = 'Bulk_Update_PSA')]
        [Alias('filter_psa_id')]
        [string]$FilterPsaID,

        [Parameter(ParameterSetName = 'Bulk_Update')]
        [Parameter(ParameterSetName = 'Bulk_Update_PSA', Mandatory = $true)]
        [ValidateSet('manage', 'autotask', 'tigerpaw', 'kaseya-bms', 'pulseway-psa', 'vorex')]
        [Alias('filter_psa_integration_type')]
        [string]$FilterPsaIntegrationType,

        [Parameter(ParameterSetName = 'Update', Mandatory = $true)]
        [Parameter(ParameterSetName = 'Bulk_Update', Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'
        $QueryParameterName = $functionName + '_ParametersQuery' -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch -Wildcard ($PSCmdlet.ParameterSetName) {
            'Bulk_Update*'  { $ResourceUri = "/locations" }
            'Update'        {

                switch ([bool]$OrganizationID) {
                    $true   { $ResourceUri = "/organizations/$OrganizationID/relationships/locations/$ID" }
                    $false  { $ResourceUri = "/locations/$ID" }
                }

            }

        }

        $query_params = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Bulk_Update') {
            if ($FilterID)                  { $query_params['filter[id]']                   = $FilterID }
            if ($FilterName)                { $query_params['filter[name]']                 = $FilterName }
            if ($FilterCity)                { $query_params['filter[city]']                 = $FilterCity }
            if ($FilterRegionID)            { $query_params['filter[region_id]']            = $FilterRegionID }
            if ($FilterCountryID)           { $query_params['filter[country_id]']            = $FilterCountryID }
            if ($FilterOrganizationID)      { $query_params['filter[organization_id]']      = $FilterOrganizationID }
            if ($FilterPsaIntegrationType)  { $query_params['filter[psa_integration_type]'] = $FilterPsaIntegrationType }
        }

        if ($PSCmdlet.ParameterSetName -eq 'Bulk_Update_PSA') {
            $query_params['filter[psa_id]'] = $FilterPsaID
        }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $query_params -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method PATCH -ResourceURI $ResourceUri -QueryParams $query_params -Data $Data
        }

    }

    end {}

}
