function Get-ITGlueModel {
<#
    .SYNOPSIS
        List or show all models

    .DESCRIPTION
        The Get-ITGlueModel cmdlet returns a list of model names for all
        manufacturers or for a specified manufacturer

        This function can call the following endpoints:
            Index = /models

            Show =  /manufacturers/:id/relationships/models

    .PARAMETER ManufacturerID
        Get models under the defined manufacturer id

    .PARAMETER FilterID
        Filter models by id

    .PARAMETER Sort
        Sort results by a defined value

        Allowed values:
        'id', 'name', 'manufacturer_id', 'created_at', 'updated_at',
        '-id', '-name', '-manufacturer_id', '-created_at', '-updated_at'

    .PARAMETER PageNumber
        Return results starting from the defined number

    .PARAMETER PageSize
        Number of results to return per page

        The maximum number of page results that can be
        requested is 1000

    .PARAMETER ID
        Get a model by id

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PageSize to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-ITGlueModel

        Returns the first 50 model results from your ITGlue account

    .EXAMPLE
        Get-ITGlueModel -ID 8765309

        Returns the model with the defined id

    .EXAMPLE
        Get-ITGlueModel -PageNumber 2 -PageSize 10

        Returns the first 10 results from the second page for models
        in your ITGlue account

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/Models/Get-ITGlueModel.html

    .LINK
        https://api.itglue.com/developer/#models-index
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    [Alias('Get-ITGlueModels')]
    Param (
        [Parameter(ParameterSetName = 'Index')]
        [Parameter(ParameterSetName = 'Show')]
        [Alias('manufacturer_id')]
        [int64]$ManufacturerID,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_id')]
        [int64]$FilterID,

        [Parameter(ParameterSetName = 'Index')]
        [ValidateSet(   'id', 'name', 'manufacturer_id', 'created_at', 'updated_at',
                        '-id', '-name', '-manufacturer_id', '-created_at', '-updated_at')]
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
            'Index' {

                if ($ManufacturerID) {
                    $ResourceUri = "/manufacturers/$ManufacturerID/relationships/models"
                }
                else{$ResourceUri = "/models"}

            }
            'False' {

                if ($ManufacturerID) {
                    $ResourceUri = "/manufacturers/$ManufacturerID/relationships/models/$ID"
                }
                else{$ResourceUri = "/models/$ID"}

            }
        }

        $query_params = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Index') {
            if ($FilterID)      { $query_params['filter[id]']   = $FilterID }
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
