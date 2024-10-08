function Get-ITGlueFlexibleAssetField {
<#
    .SYNOPSIS
        List or show all flexible assets fields

    .DESCRIPTION
        The Get-ITGlueFlexibleAssetField cmdlet lists or shows all flexible asset fields
        for a particular flexible asset type

        This function can call the following endpoints:
            Index = /flexible_asset_types/:flexible_asset_type_id/relationships/flexible_asset_fields

            Show =  /flexible_asset_fields/:id
                    /flexible_asset_types/:flexible_asset_type_id/relationships/flexible_asset_fields/:id

    .PARAMETER FlexibleAssetTypeID
        A valid Flexible asset Id in your Account

    .PARAMETER FilterID
        Filter by a flexible asset field id

    .PARAMETER Sort
        Sort results by a defined value

        Allowed values:
        'created_at', 'updated_at',
        '-created_at', '-updated_at'

    .PARAMETER PageNumber
        Return results starting from the defined number

    .PARAMETER PageSize
        Number of results to return per page

        The maximum number of page results that can be
        requested is 1000

    .PARAMETER ID
        A valid Flexible asset type Id in your Account

    .PARAMETER Include
        Include specified assets

        Allowed values:
        remote_asset_field

    .PARAMETER AllResults
        Returns all items from an endpoint

        This can be used in unison with -PageSize to limit the number of
        sequential requests to the API

    .EXAMPLE
        Get-ITGlueFlexibleAssetField -FlexibleAssetTypeID 12345

        Returns all the fields in a flexible asset with the defined id

    .EXAMPLE
        Get-ITGlueFlexibleAssetField -ID 8765309

        Returns single field in a flexible asset with the defined id

    .EXAMPLE
        Get-ITGlueFlexibleAssetField -FlexibleAssetTypeID 12345 -PageNumber 2 -PageSize 10

        Returns the first 10 results from the second page for flexible asset fields
        from the defined id

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetFields/Get-ITGlueFlexibleAssetField.html

    .LINK
        https://api.itglue.com/developer/#flexible-asset-fields-index
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    [Alias('Get-ITGlueFlexibleAssetFields')]
    Param (
        [Parameter(ParameterSetName = 'Index', Mandatory = $true)]
        [Parameter(ParameterSetName = 'Show')]
        [Alias('flexible_asset_type_id')]
        [int64]$FlexibleAssetTypeID,

        [Parameter(ParameterSetName = 'Index')]
        [Alias('filter_id')]
        [int64]$FilterID,

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

        [Parameter(ParameterSetName = 'Show', ValueFromPipeline = $true , Mandatory = $true)]
        [int64]$ID,

        [Parameter(ParameterSetName = 'Index')]
        [ValidateSet('remote_asset_field')]
        [string]$Include,

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
            'Index' { $ResourceUri = "/flexible_asset_types/$FlexibleAssetTypeID/relationships/flexible_asset_fields" }
            'Show'  {

                switch ([bool]$FlexibleAssetTypeID) {
                    $true   { $ResourceUri = "/flexible_asset_types/$FlexibleAssetTypeID/relationships/flexible_asset_fields/$ID" }
                    $false  { $ResourceUri = "/flexible_asset_fields/$ID" }
                }

            }
        }

        $query_params = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Index') {
            if ($FilterID)      { $query_params['filter[id]']   = $FilterID }
            if ($Sort)          { $query_params['sort']         = $Sort }
            if ($PageNumber)    { $query_params['page[number]'] = $PageNumber }
            if ($PageSize)      { $query_params['page[size]']   = $PageSize }
            if ($Include)       { $query_params['include']      = $Include }
        }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $query_params -Scope Global -Force -Confirm:$false

        return Invoke-ITGlueRequest -Method GET -ResourceURI $ResourceUri -QueryParams $query_params -AllResults:$AllResults

    }

    end {}

}
