function Remove-ITGlueConfiguration {
<#
    .SYNOPSIS
        Deletes one or more configurations

    .DESCRIPTION
        The Remove-ITGlueConfiguration cmdlet deletes one or
        more specified configurations

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ID
        A valid configuration Id

    .PARAMETER ID
        A valid configuration Id

    .PARAMETER FilterID
        Filter by configuration id

    .PARAMETER FilterName
        Filter by configuration name

    .PARAMETER FilterOrganizationID
        Filter by organization name

    .PARAMETER FilterConfigurationTypeID
        Filter by configuration type id

    .PARAMETER FilterConfigurationStatusID
        Filter by configuration status id

    .PARAMETER FilterContactID
        Filter by contact id

    .PARAMETER FilterSerialNumber
        Filter by a configurations serial number

    .PARAMETER FilterMacAddress
        Filter by a configurations mac address

    .PARAMETER FilterAssetTag
        Filter by a configurations asset tag

    .PARAMETER FilterPsaID
        Filter by a PSA id

    .PARAMETER FilterPsaIntegrationType
        Filter by a PSA integration type

        Allowed values:
        'manage', 'autotask', 'tigerpaw', 'kaseya-bms', 'pulseway-psa', 'vorex'

    .PARAMETER FilterRmmID
        Filter by a RMM id

    .PARAMETER FilterRmmIntegrationType
        Filter by a RMM integration type

        Allowed values:
        'addigy', 'aem', 'atera', 'auvik', 'managed-workplace',
        'continuum', 'jamf-pro', 'kaseya-vsa', 'automate', 'log-me-in',
        'msp-rmm', 'meraki', 'msp-n-central', 'ninja-rmm', 'panorama9',
        'pulseway-rmm', 'syncro', 'watchman-monitoring','office365','vsa-x'

    .PARAMETER FilterArchived
        Filter for archived

        Allowed values: (case-sensitive)
        'true', 'false', '0', '1'

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Remove-ITGlueConfiguration -ID 8765309 -Data $JsonObject

        Deletes a defined configuration with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/Configurations/Remove-ITGlueConfiguration.html

    .LINK
        https://api.itglue.com/developer/#configurations-bulk-destroy
#>

    [CmdletBinding(DefaultParameterSetName = 'Bulk_Destroy', SupportsShouldProcess, ConfirmImpact = 'High')]
    [Alias('New-ITGlueConfigurations')]
    Param (
        [Parameter(ParameterSetName = 'Destroy', Mandatory = $true)]
        [int64]$ID,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [Alias('filter_id')]
        [int64]$FilterID,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [Alias('filter_name')]
        [string]$FilterName,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [Alias('filter_organization_id')]
        [int64]$FilterOrganizationID,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [Alias('filter_configuration_type_id')]
        [int64]$FilterConfigurationTypeID,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [Alias('filter_configuration_status_id')]
        [int64]$FilterConfigurationStatusID,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [Alias('filter_contact_id')]
        [int64]$FilterContactID,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [Alias('filter_serial_number')]
        [string]$FilterSerialNumber,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [Alias('filter_mac_address')]
        [string]$FilterMacAddress,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [Alias('filter_asset_tag')]
        [string]$FilterAssetTag,

        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [Alias('filter_psa_id')]
        [string]$FilterPsaID,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA', Mandatory = $true)]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA', Mandatory = $true)]
        [ValidateSet('manage', 'autotask', 'tigerpaw', 'kaseya-bms', 'pulseway-psa', 'vorex')]
        [Alias('filter_psa_integration_type')]
        [string]$FilterPsaIntegrationType,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [Alias('filter_rmm_id')]
        [string]$FilterRmmID,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM', Mandatory = $true)]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA', Mandatory = $true)]
        [ValidateSet(   'addigy', 'aem', 'atera', 'auvik', 'managed-workplace',
                        'continuum', 'jamf-pro', 'kaseya-vsa', 'automate', 'log-me-in',
                        'msp-rmm', 'meraki', 'msp-n-central', 'ninja-rmm', 'panorama9',
                        'pulseway-rmm', 'syncro', 'watchman-monitoring','office365','vsa-x'
        )]
        [Alias('filter_rmm_integration_type')]
        [string]$FilterRmmIntegrationType,

        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA')]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA')]
        [ValidateSet('true','false','0','1', IgnoreCase = $false)]
        [Alias('filter_archived')]
        [string]$FilterArchived,

        [Parameter(ParameterSetName = 'Bulk_Destroy', Mandatory = $true)]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM', Mandatory = $true)]
        [Parameter(ParameterSetName = 'Bulk_Destroy_PSA', Mandatory = $true)]
        [Parameter(ParameterSetName = 'Bulk_Destroy_RMM_PSA', Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'
        $QueryParameterName = $functionName + '_ParametersQuery' -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ([bool]$OrganizationID) {
            $true   { $ResourceUri = "/configurations/$OrganizationID/relationships/configurations" }
            $false  { $ResourceUri = "/configurations" }
        }

        $query_params = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -like 'Bulk_Destroy*') {
            if ($FilterID)                      { $query_params['filter[id]']                       = $FilterID }
            if ($FilterName)                    { $query_params['filter[name]']                     = $FilterName }
            if ($FilterOrganizationID)          { $query_params['filter[organization_id]']          = $FilterOrganizationID }
            if ($FilterConfigurationTypeID)     { $query_params['filter[configuration_type_id]']    = $FilterConfigurationTypeID }
            if ($FilterConfigurationStatusID)   { $query_params['filter[configuration_status_id]']  = $FilterConfigurationStatusID }
            if ($FilterContactID)               { $query_params['filter[contact_id]']               = $FilterContactID }
            if ($FilterSerialNumber)            { $query_params['filter[serial_number]']            = $FilterSerialNumber }
            if ($FilterMacAddress)              { $query_params['filter[mac_address]']              = $FilterMacAddress }
            if ($FilterAssetTag)                { $query_params['filter[asset_tag]']                = $FilterAssetTag }
            if ($FilterPsaIntegrationType)      { $query_params['filter[psa_integration_type]']     = $FilterPsaIntegrationType }
            if ($FilterRmmIntegrationType)      { $query_params['filter[rmm_integration_type]']     = $FilterRmmIntegrationType }
            if ($FilterArchived)                { $query_params['filter[archived]']                 = $FilterArchived }
        }

        if ($PSCmdlet.ParameterSetName -like 'Bulk_Destroy_RMM*') {
            if ($FilterRmmID) {$query_params['filter[rmm_id]'] = $FilterRmmID}
        }
        if ($PSCmdlet.ParameterSetName -like '*_PSA') {
            if ($FilterPsaID) {$query_params['filter[psa_id]'] = $FilterPsaID}
        }

        if ($PSCmdlet.ParameterSetName -eq 'Destroy') {
            $Data = @(
                @{
                    type = 'configurations'
                    attributes = @{
                        id = $ID
                    }
                }
            )
        }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $query_params -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method DELETE -ResourceURI $ResourceUri -Data $Data -QueryParams $query_params
        }

    }

    end {}

}
