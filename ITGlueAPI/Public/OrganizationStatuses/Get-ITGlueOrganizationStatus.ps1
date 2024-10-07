function Get-ITGlueOrganizationStatus {
<#
    .SYNOPSIS
        List or show all organization statuses

    .DESCRIPTION
        The Get-ITGlueOrganizationStatus cmdlet returns a list of organization
        statuses or the details of a single organization status in your account

        This function can call the following endpoints:
            Index = /organization_statuses

            Show =  /organization_statuses/:id

    .PARAMETER FilterName
        Filter by organization status name

    .PARAMETER Sort
        Sort results by a defined value

        Allowed values:
        'name', 'id', 'created_at', 'updated_at',
        '-name', '-id', '-created_at', '-updated_at'

    .PARAMETER PageNumber
        Return results starting from the defined number

    .PARAMETER PageSize
        Number of results to return per page

        The maximum number of page results that can be
        requested is 1000

    .PARAMETER ID
        Get an organization status by id

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PageSize to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-ITGlueOrganizationStatus

        Returns the first 50 organization statuses results from your ITGlue account

    .EXAMPLE
        Get-ITGlueOrganizationStatus -ID 8765309

        Returns the organization statuses with the defined id

    .EXAMPLE
        Get-ITGlueOrganizationStatus -PageNumber 2 -PageSize 10

        Returns the first 10 results from the second page for organization statuses
        in your ITGlue account

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/OrganizationStatuses/Get-ITGlueOrganizationStatus.html

    .LINK
        https://api.itglue.com/developer/#organization-statuses-index
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    [Alias('Get-ITGlueOrganizationStatuses')]
    Param (
        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_name')]
        [string]$FilterName,

        [Parameter(ParameterSetName = 'Index')]
        [ValidateSet(   'name', 'id', 'created_at', 'updated_at',
                        '-name', '-id', '-created_at', '-updated_at')]
        [string]$Sort,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('page_number')]
        [int64]$PageNumber,

        [Parameter(ParameterSetName = 'Index')]
        [ValidateRange(1,1000)]
        [Alias('page_size')]
        [int]$PageSize,

        [Parameter(ParameterSetName = 'Show', ValueFromPipeline = $true , Mandatory = $true)]
        [int64]$ID,

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

        switch ($PSCmdlet.ParameterSetName) {
            'Index' { $ResourceUri = "/organization_statuses" }
            'Show'  { $ResourceUri = "/organization_statuses/$ID" }
        }

        $query_params = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Index') {
            if ($FilterName)    { $query_params['filter[name]'] = $FilterName }
            if ($Sort)          { $query_params['sort']         = $Sort }
            if ($PageNumber)    { $query_params['page[number]'] = $PageNumber }
            if ($PageSize)      { $query_params['page[size]']   = $PageSize }
        }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $query_params -Scope Global -Force -Confirm:$false

        return Invoke-ITGlueRequest -Method GET -ResourceURI $ResourceUri -QueryParams $query_params -AllResults:$AllResults

    }

    end {}

}
