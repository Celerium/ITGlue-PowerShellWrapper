function Get-ITGlueUser {
<#
    .SYNOPSIS
        List or show all users

    .DESCRIPTION
        The Get-ITGlueUser cmdlet returns a list of the users
        or the details of a single user in your account

        This function can call the following endpoints:
            Index = /users

            Show =  /users/:id

    .PARAMETER FilterID
        Filter by user ID

    .PARAMETER FilterName
        Filter by user name

    .PARAMETER FilterEmail
        Filter by user email address

    .PARAMETER FilterRoleName
        Filter by a users role

        Allowed values:
            'Administrator', 'Manager', 'Editor', 'Creator', 'Lite', 'Read-only'

    .PARAMETER FilterSalesforceID
        Filter by Salesforce ID

    .PARAMETER Sort
        Sort results by a defined value

        Allowed values:
        'name', 'email', 'reputation', 'id', 'created_at', 'updated-at',
        '-name', '-email', '-reputation', '-id', '-created_at', '-updated-at'

    .PARAMETER PageNumber
        Return results starting from the defined number

    .PARAMETER PageSize
        Number of results to return per page

        The maximum number of page results that can be
        requested is 1000

    .PARAMETER ID
        Get a user by id

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PageSize to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-ITGlueUser

        Returns the first 50 user results from your ITGlue account

    .EXAMPLE
        Get-ITGlueUser -ID 8765309

        Returns the user with the defined id

    .EXAMPLE
        Get-ITGlueUser -PageNumber 2 -PageSize 10

        Returns the first 10 results from the second page for users
        in your ITGlue account

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/Users/Get-ITGlueUser.html

    .LINK
        https://api.itglue.com/developer/#accounts-users-index
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    [Alias('Get-ITGlueUsers')]
    Param (
        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_id')]
        [int64]$FilterID,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_name')]
        [string]$FilterName,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_email')]
        [string]$FilterEmail,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_role_name')]
        [ValidateSet('Administrator', 'Manager', 'Editor', 'Creator', 'Lite', 'Read-only')]
        [string]$FilterRoleName,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_salesforce_id')]
        [int64]$FilterSalesForceID,

        [Parameter(ParameterSetName = 'Index')]
        [ValidateSet(   'name', 'email', 'reputation', 'id', 'created_at', 'updated-at',
                        '-name', '-email', '-reputation', '-id', '-created_at', '-updated-at')]
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
            'Index' { $ResourceUri = "/users" }
            'Show'  { $ResourceUri = "/users/$ID" }
        }


        $query_params = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Index') {
            if ($FilterID)              { $query_params['filter[id]']               = $FilterID }
            if ($FilterName)            { $query_params['filter[name]']             = $FilterName }
            if ($FilterEmail)           { $query_params['filter[email]']            = $FilterEmail }
            if ($FilterRoleName)        { $query_params['filter[role_name]']        = $FilterRoleName }
            if ($FilterSalesForceID)    { $query_params['filter[salesforce_id]']    = $FilterSalesForceID }
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
