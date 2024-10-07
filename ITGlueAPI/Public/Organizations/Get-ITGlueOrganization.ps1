function Get-ITGlueOrganization {
<#
    .SYNOPSIS
        List or show all organizations

    .DESCRIPTION
        The Get-ITGlueOrganization cmdlet returns a list of organizations
        or details for a single organization in your account

        This function can call the following endpoints:
            Index = /organizations

            Show =  /organizations/:id

    .PARAMETER FilterID
        Filter by an organization id

    .PARAMETER FilterName
        Filter by an organization name

    .PARAMETER FilterOrganizationTypeID
        Filter by an organization type id

    .PARAMETER FilterOrganizationStatusID
        Filter by an organization status id

    .PARAMETER FilterCreatedAt
        Filter by when an organization created

    .PARAMETER FilterUpdatedAt
        Filter by when an organization updated

    .PARAMETER FilterMyGlueAccountID
        Filter by a MyGlue id

    .PARAMETER FilterPsaID
        Filter by a PSA id

    .PARAMETER FilterPsaIntegrationType
        Filter by a PSA integration type

        Allowed values:
        'manage', 'autotask', 'tigerpaw', 'kaseya-bms', 'pulseway-psa', 'vorex'

    .PARAMETER FilterGroupID
        Filter by a group id

    .PARAMETER FilterPrimary
        Filter for primary organization

        Allowed values:
        'true', 'false'

    .PARAMETER FilterExcludeID
        Filter to excluded a certain organization id

    .PARAMETER FilterExcludeName
        Filter to excluded a certain organization name

    .PARAMETER FilterExcludeOrganizationTypeID
        Filter to excluded a certain organization type id

    .PARAMETER FilterExcludeOrganizationStatusID
        Filter to excluded a certain organization status id

    .PARAMETER FilterRange
        Filter organizations by range

    .PARAMETER FilterRangeMyGlueAccountID
        Filter MyGLue organization id range

    .PARAMETER Sort
        Sort results by a defined value

        Allowed values:
        'name', 'id', 'updated_at', 'organization_status_name', 'organization_type_name',
        'created_at', 'short_name', 'my_glue_account_id', '-name', '-id', '-updated_at',
        '-organization_status_name', '-organization_type_name', '-created_at',
        '-short_name', '-my_glue_account_id'

    .PARAMETER PageNumber
        Return results starting from the defined number

    .PARAMETER PageSize
        Number of results to return per page

        The maximum number of page results that can be
        requested is 1000

    .PARAMETER ID
        Get an organization by id

    .PARAMETER Include
        Include specified assets

        Allowed values (Shared):
        adapters_resources, attachments, rmm_companies

        Allowed values (Index-Unique):
        N/A

        Allowed values (Show-Unique):
        N/A

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PageSize to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-ITGlueOrganization

        Returns the first 50 organizations results from your ITGlue account

    .EXAMPLE
        Get-ITGlueOrganization -ID 8765309

        Returns the organization with the defined id

    .EXAMPLE
        Get-ITGlueOrganization -PageNumber 2 -PageSize 10

        Returns the first 10 results from the second page for organizations
        in your ITGlue account

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Organizations/Get-ITGlueOrganization.html

    .LINK
        https://api.itglue.com/developer/#organizations-index
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    [Alias('Get-ITGlueOrganizations')]
    Param (
        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_id')]
        [int64]$FilterID,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_name')]
        [string]$FilterName,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_organization_type_id')]
        [int64]$FilterOrganizationTypeID,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_organization_status_id')]
        [int64]$FilterOrganizationStatusID,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_created_at')]
        [string]$FilterCreatedAt,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_updated_at')]
        [string]$FilterUpdatedAt,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_my_glue_account_id')]
        [int64]$FilterMyGlueAccountID,

        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_psa_id')]
        [string]$FilterPsaID,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA', Mandatory = $true)]
        [ValidateSet( 'manage', 'autotask', 'tigerpaw', 'kaseya-bms', 'pulseway-psa', 'vorex')]
        [Alias('filter_psa_integration_type')]
        [string]$FilterPsaIntegrationType,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_group_id')]
        [int64]$FilterGroupID,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [ValidateSet( 'true', 'false')]
        [Alias('filter_primary')]
        [string]$FilterPrimary,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_exclude_id')]
        [int64]$FilterExcludeID,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_exclude_name')]
        [string]$FilterExcludeName,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_exclude_organization_type_id')]
        [int64]$FilterExcludeOrganizationTypeID,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_exclude_organization_status_id')]
        [int64]$FilterExcludeOrganizationStatusID,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_range')]
        [string]$FilterRange,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('filter_range_my_glue_account_id')]
        [int64]$FilterRangeMyGlueAccountID,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [ValidateSet( 'name', 'id', 'updated_at', 'organization_status_name', 'organization_type_name', 'created_at', 'short_name', 'my_glue_account_id',
                '-name', '-id', '-updated_at', '-organization_status_name', '-organization_type_name', '-created_at', '-short_name', '-my_glue_account_id')]
        [string]$Sort,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Alias('page_number')]
        [int64]$PageNumber,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [ValidateRange(1,1000)]
        [Alias('page_size')]
        [int]$PageSize,

        [Parameter(ParameterSetName = 'Show', ValueFromPipeline = $true , Mandatory = $true)]
        [int64]$ID,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [Parameter(ParameterSetName = 'Show')]
        [ValidateSet( 'adapters_resources', 'attachments', 'rmm_companies' )]
        [string]$Include,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Index_PSA')]
        [switch]$AllResults
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'
        $QueryParameterName = $functionName + '_ParametersQuery' -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch -Wildcard ($PSCmdlet.ParameterSetName) {
            'Index*'    { $ResourceUri = "/organizations" }
            'Show'      { $ResourceUri = "/organizations/$ID" }
        }

        $query_params = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -like 'Index*') {
            if ($FilterID)                          { $query_params['filter[id]']                               = $FilterID }
            if ($FilterName)                        { $query_params['filter[name]']                             = $FilterName }
            if ($FilterOrganizationTypeID)          { $query_params['filter[organization_type_id]']             = $FilterOrganizationTypeID }
            if ($FilterOrganizationStatusID)        { $query_params['filter[organization_status_id]']           = $FilterOrganizationStatusID }
            if ($FilterCreatedAt)                   { $query_params['filter[created_at]']                       = $FilterCreatedAt }
            if ($FilterUpdatedAt)                   { $query_params['filter[updated_at]']                       = $FilterUpdatedAt }
            if ($FilterMyGlueAccountID)             { $query_params['filter[my_glue_account_id]']               = $FilterMyGlueAccountID }
            if ($FilterPsaIntegrationType)          { $query_params['filter[psa_integration_type]']             = $FilterPsaIntegrationType }
            if ($FilterGroupID)                     { $query_params['filter[group_id]']                         = $FilterGroupID }
            if ($FilterPrimary)                     { $query_params['filter[primary]']                          = $FilterPrimary }
            if ($FilterExcludeID)                   { $query_params['filter[exclude][id]']                      = $FilterExcludeID }
            if ($FilterExcludeName)                 { $query_params['filter[exclude][name]']                    = $FilterExcludeName }
            if ($FilterExcludeOrganizationTypeID)   { $query_params['filter[exclude][organization_type_id]']    = $FilterExcludeOrganizationTypeID }
            if ($FilterExcludeOrganizationStatusID) { $query_params['filter[exclude][organization_status_id]']  = $FilterExcludeOrganizationStatusID }
            if ($FilterRange)                       { $query_params['filter[range]']                            = $FilterRange }
            if ($FilterRangeMyGlueAccountID)        { $query_params['filter[range][my_glue_account_id]']        = $FilterRangeMyGlueAccountID }
            if ($Sort)                              { $query_params['sort']                                     = $Sort }
            if ($PageNumber)                        { $query_params['page[number]']                             = $PageNumber }
            if ($PageSize)                          { $query_params['page[size]']                               = $PageSize }
        }

        if ($PSCmdlet.ParameterSetName -eq 'Index_PSA') {
            if ($FilterPsaID) { $query_params['filter[psa_id]'] = $FilterPsaID }
        }

        #Shared Parameters
        if($Include) { $query_params['include'] = $Include }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $query_params -Scope Global -Force -Confirm:$false

        return Invoke-ITGlueRequest -Method GET -ResourceURI $ResourceUri -QueryParams $query_params -AllResults:$AllResults

    }

    end {}

}
