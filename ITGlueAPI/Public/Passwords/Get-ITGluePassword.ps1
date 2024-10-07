function Get-ITGluePassword {
<#
    .SYNOPSIS
        List or show all passwords

    .DESCRIPTION
        The Get-ITGluePassword cmdlet returns a list of passwords for all organizations,
        a specified organization, or the details of a single password

        To show passwords, your API key needs to have "Password Access" permission

        This function can call the following endpoints:
            Index = /passwords
                    /organizations/:organization_id/relationships/passwords

            Show =  /passwords/:id
                    /organizations/:organization_id/relationships/passwords/:id

    .PARAMETER OrganizationID
        A valid organization Id in your account

    .PARAMETER FilterID
        Filter by password id

    .PARAMETER FilterName
        Filter by password name

    .PARAMETER FilterOrganizationID
        Filter for passwords by organization id

    .PARAMETER FilterPasswordCategoryID
        Filter by passwords category id

    .PARAMETER FilterUrl
        Filter by password url

    .PARAMETER FilterCachedResourceName
        Filter by a passwords cached resource name

    .PARAMETER FilterArchived
        Filter for archived

        Allowed values: (case-sensitive)
        'true', 'false', '0', '1'

    .PARAMETER Sort
        Sort results by a defined value

        Allowed values:
        'name', 'username', 'id', 'created_at', 'updated-at',
        '-name', '-username', '-id', '-created_at', '-updated-at'

    .PARAMETER PageNumber
        Return results starting from the defined number

    .PARAMETER PageSize
        Number of results to return per page

        The maximum number of page results that can be
        requested is 1000

    .PARAMETER ID
        Get a password by id

    .PARAMETER ShowPassword
        Define if the password should be shown or not

        By default ITGlue hides the passwords from the returned data

        Allowed values: (case-sensitive)
        'true', 'false'

    .PARAMETER VersionID
        Set the password's version ID to return it's revision

    .PARAMETER Include
        Include specified assets

        Allowed values (Shared):
        attachments, group_resource_accesses, network_glue_networks,
        rotatable_password,updater,user_resource_accesses

        Allowed values (Index-Unique):
        N/A

        Allowed values (Show-Unique):
        recent_versions, related_items, authorized_users

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PageSize to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-ITGluePassword

        Returns the first 50 password results from your ITGlue account

    .EXAMPLE
        Get-ITGluePassword -ID 8765309

        Returns the password with the defined id

    .EXAMPLE
        Get-ITGluePassword -PageNumber 2 -PageSize 10

        Returns the first 10 results from the second page for passwords
        in your ITGlue account

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/Passwords/Get-ITGluePassword.html

    .LINK
        https://api.itglue.com/developer/#passwords-index
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    [Alias('Get-ITGluePasswords')]
    Param (
        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Show')]
        [Alias('org_id','organization_id')]
        [int64]$OrganizationID,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_id')]
        [int64]$FilterID,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_name')]
        [string]$FilterName,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_organization_id')]
        [int64]$FilterOrganizationID,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_password_category_id')]
        [int64]$FilterPasswordCategoryID,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_url')]
        [string]$FilterUrl,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_cached_resource_name')]
        [string]$FilterCachedResourceName,

        [Parameter(ParameterSetName = 'Index')]
        [ValidateSet('true','false','0','1', IgnoreCase = $false)]
        [Alias('filter_archived')]
        [string]$FilterArchived,

        [Parameter(ParameterSetName = 'Index')]
        [ValidateSet(   'name', 'username', 'url', 'id', 'created_at', 'updated-at',
                        '-name', '-username', '-url', '-id', '-created_at', '-updated-at')]
        [string]$Sort,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('page_number')]
        [int64]$PageNumber,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('page_size')]
        [int64]$PageSize,

        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Show')]
        [ValidateSet(   'attachments', 'authorized_users', 'group_resource_accesses',
                        'network_glue_networks', 'recent_versions', 'related_items',
                        'rotatable_password', 'updater', 'user_resource_accesses'
        )]
        $Include,

        [Parameter(ParameterSetName = 'Show', ValueFromPipeline = $true , Mandatory = $true)]
        [int64]$ID,

        [Parameter(ParameterSetName = 'Show')]
        [ValidateSet('true', 'false', IgnoreCase = $false)]
        [Alias('show_password')]
        [string]$ShowPassword,

        [Parameter(ParameterSetName = 'Show')]
        [int64]$VersionID,

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

        switch ($PSCmdlet.ParameterSetName){
            'Index' {

                switch ([bool]$OrganizationID) {
                    $true   { $ResourceUri = "/organizations/$OrganizationID/relationships/passwords" }
                    $false  { $ResourceUri = "/passwords" }
                }

            }
            'Show'  {

                switch ([bool]$OrganizationID) {
                    $true   { $ResourceUri = "/organizations/$OrganizationID/relationships/passwords/$ID" }
                    $false  { $ResourceUri = "/passwords/$ID" }
                }

            }
        }

        $query_params = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Index') {
            if ($FilterID)                  { $query_params['filter[id]']                   = $FilterID }
            if ($FilterName)                { $query_params['filter[name]']                 = $FilterName }
            if ($FilterOrganizationID)      { $query_params['filter[organization_id]']      = $FilterOrganizationID }
            if ($FilterPasswordCategoryID)  { $query_params['filter[password_category_id]'] = $FilterPasswordCategoryID }
            if ($FilterUrl)                 { $query_params['filter[url]']                  = $FilterUrl }
            if ($FilterCachedResourceName)  { $query_params['filter[cached_resource_name]'] = $FilterCachedResourceName }
            if ($FilterArchived)            { $query_params['filter[archived]']             = $FilterArchived }
            if ($Sort)                      { $query_params['sort']                         = $Sort }
            if ($PageNumber)                { $query_params['page[number]']                 = $PageNumber }
            if ($PageSize)                  { $query_params['page[size]']                   = $PageSize }
        }

        if ($PSCmdlet.ParameterSetName -eq 'show') {
            if ($ShowPassword)  { $query_params['show_password']    = $ShowPassword }
            if ($VersionID)     { $query_params['version_id']       = $VersionID }
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
