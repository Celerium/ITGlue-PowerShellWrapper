function New-ITGlueFlexibleAssetField {
<#
    .SYNOPSIS
        Creates one or more flexible asset fields

    .DESCRIPTION
        The New-ITGlueFlexibleAssetField cmdlet creates one or more
        flexible asset field for a particular flexible asset type

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER FlexibleAssetTypeID
        The flexible asset type id to create a new field in

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGlueFlexibleAssetField -FlexibleAssetTypeID 8675309 -Data $JsonObject

        Creates a new flexible asset field for the defined id with the structured
        JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetFields/New-ITGlueFlexibleAssetField.html

    .LINK
        https://api.itglue.com/developer/#flexible-asset-fields-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueFlexibleAssetFields')]
    Param (
        [Parameter()]
        [Alias('flexible_asset_type_id')]
        [int64]$FlexibleAssetTypeID,

        [Parameter(Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ([bool]$FlexibleAssetTypeID) {
            $true   { $ResourceUri = "/flexible_asset_types/$FlexibleAssetTypeID/relationships/flexible_asset_fields" }
            $false  { $ResourceUri = "/flexible_asset_fields" }
        }

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
