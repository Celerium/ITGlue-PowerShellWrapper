function Get-ITGlueUserMetric {
<#
    .SYNOPSIS
        Lists all user metrics

    .DESCRIPTION
        The Get-ITGlueUserMetric cmdlet lists all user metrics

    .PARAMETER FilterUserID
        Filter by user id

    .PARAMETER FilterOrganizationID
        Filter for users metrics by organization id

    .PARAMETER FilterResourceType
        Filter for user metrics by resource type

        Example:
            'Configurations','Passwords','Active Directory'

    .PARAMETER FilterDate
        Filter for users metrics by a date range

        The dates are UTC

        The specified string must be a date range and comma-separated start_date, end_date

        Use * for unspecified start_date or end_date

        Date ranges longer than a week may be disallowed for performance reasons

    .PARAMETER Sort
        Sort results by a defined value

        Allowed values:
        'id', 'created', 'viewed', 'edited', 'deleted', 'date',
        '-id', '-created', '-viewed', '-edited', '-deleted', '-date'

    .PARAMETER PageNumber
        Return results starting from the defined number

    .PARAMETER PageSize
        Number of results to return per page

        The maximum number of page results that can be
        requested is 1000

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PageSize to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-ITGlueUserMetric

        Returns the first 50 user metric results from your ITGlue account

    .EXAMPLE
        Get-ITGlueUserMetric -FilterUserID 12345

        Returns the user metric for the user with the defined id

    .EXAMPLE
        Get-ITGlueUserMetric -PageNumber 2 -PageSize 10

        Returns the first 10 results from the second page for user metrics
        in your ITGlue account

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/UserMetrics/Get-ITGlueUserMetric.html

    .LINK
        https://api.itglue.com/developer/#accounts-user-metrics-daily-index
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    [Alias('Get-ITGlueUserMetrics')]
    Param (
        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_user_id')]
        [int64]$FilterUserID,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_organization_id')]
        [int64]$FilterOrganizationID,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_resource_type')]
        [string]$FilterResourceType,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_date')]
        [string]$FilterDate,

        [Parameter(ParameterSetName = 'Index')]
        [ValidateSet(   'id', 'created', 'viewed', 'edited', 'deleted', 'date',
                        '-id', '-created', '-viewed', '-edited', '-deleted', '-date')]
        [string]$Sort,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('page_number')]
        [int64]$PageNumber,

        [Parameter(ParameterSetName = 'Index')]
        [ValidateRange(1,1000)]
        [Alias('page_size')]
        [int]$PageSize,

        [Parameter(ParameterSetName = 'Index')]
        [switch]$AllResults
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'
        $QueryParameterName = $functionName + '_ParametersQuery' -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = '/user_metrics'

        $query_params = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Index') {
            if ($FilterUserID)          { $query_params['filter[user_id]']          = $FilterUserID }
            if ($FilterOrganizationID)  { $query_params['filter[organization_id]']  = $FilterOrganizationID }
            if ($FilterResourceType)    { $query_params['filter[resource_type]']    = $FilterResourceType }
            if ($FilterDate)            { $query_params['filter[date]']             = $FilterDate }
            if ($Sort)                  { $query_params['sort']                     = $Sort }
            if ($PageNumber)            { $query_params['page[number]']             = $PageNumber }
            if ($PageSize)              { $query_params['page[size]']               = $PageSize }
        }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $query_params -Scope Global -Force -Confirm:$false

        return Invoke-ITGlueRequest -Method GET -ResourceURI $ResourceUri -QueryParams $query_params -AllResults:$AllResults

    }

    end {}

}
