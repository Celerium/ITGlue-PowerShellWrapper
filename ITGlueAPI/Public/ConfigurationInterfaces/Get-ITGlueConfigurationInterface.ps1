function Get-ITGlueConfigurationInterface {
<#
    .SYNOPSIS
        Retrieve a configuration(s) interface(s)

    .DESCRIPTION
        The Get-ITGlueConfigurationInterface cmdlet retrieves a
        configuration(s) interface(s)

        This function can call the following endpoints:
            Index = /configurations/:conf_id/relationships/configuration_interfaces

            Show =  /configuration_interfaces/:id
                    /configurations/:id/relationships/configuration_interfaces/:id

    .PARAMETER ConfigurationID
        A valid configuration ID in your account

    .PARAMETER FilterID
        Configuration id to filter by

    .PARAMETER FilterIPAddress
        IP address to filter by

    .PARAMETER Sort
        Sort results by a defined value

        Allowed values:
        'created_at', 'updated_at', '-created_at', '-updated_at'

    .PARAMETER PageNumber
        Return results starting from the defined number

    .PARAMETER PageSize
        Number of results to return per page

        The maximum number of page results that can be
        requested is 1000

    .PARAMETER ID
        A valid configuration interface ID in your account

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PageSize to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-ITGlueConfigurationInterface -ConfigurationID 8765309

        Gets an index of all the defined configurations interfaces

    .EXAMPLE
        Get-ITGlueConfigurationInterface -ConfigurationID 8765309 -ID 8765309

        Gets an a defined interface from a defined configuration

    .EXAMPLE
        Get-ITGlueConfigurationInterface -ConfigurationID 8765309 -ID 8765309

        Gets a defined interface from a defined configuration

    .EXAMPLE
        Get-ITGlueConfigurationInterface -ID 8765309

        Gets a defined interface

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/ConfigurationInterfaces/Get-ITGlueConfigurationInterface.html

    .LINK
        https://api.itglue.com/developer/#configuration-interfaces-index
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    [Alias('Get-ITGlueConfigurationInterfaces')]
    Param (
        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Show')]
        [Alias('conf_id','configuration_id')]
        [int64]$ConfigurationID,

        [Parameter(ParameterSetName = 'Show', ValueFromPipeline = $true , Mandatory = $true)]
        [int64]$ID,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_id')]
        [int64]$FilterID,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_ip_address')]
        [string]$FilterIPAddress,

        [Parameter(ParameterSetName = 'Index')]
        [ValidateSet(   'created_at', 'updated_at',
                        '-created_at', '-updated_at')]
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

        switch ($PsCmdlet.ParameterSetName) {
            'Index' {

                switch ([bool]$ConfigurationID) {
                    $true   { $ResourceUri = "/configurations/$ConfigurationID/relationships/configuration_interfaces" }
                    $false  { $ResourceUri = "/configuration_interfaces" }
                }

            }
            'Show'  {

                switch ([bool]$ConfigurationID) {
                    $true   { $ResourceUri = "/configurations/$ConfigurationID/relationships/configuration_interfaces/$ID" }
                    $false  { $ResourceUri = "/configuration_interfaces/$ID" }
                }

            }
        }

        $query_params = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Index') {
            if ($FilterID)          { $query_params['filter[id]']           = $FilterID }
            if ($FilterIPAddress)   { $query_params['filter[ip_address]']   = $FilterIPAddress }
            if ($Sort)              { $query_params['sort']                 = $Sort }
            if ($PageNumber)        { $query_params['page[number]']         = $PageNumber}
            if ($PageSize)          { $query_params['page[size]']           = $PageSize}
        }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $query_params -Scope Global -Force -Confirm:$false

        return Invoke-ITGlueRequest -Method GET -ResourceURI $ResourceUri -QueryParams $query_params -AllResults:$AllResults

    }

    end {}

}