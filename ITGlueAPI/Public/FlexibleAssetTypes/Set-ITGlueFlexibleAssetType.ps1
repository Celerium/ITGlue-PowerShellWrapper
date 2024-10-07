function Set-ITGlueFlexibleAssetType {
<#
    .SYNOPSIS
        Updates a flexible asset type

    .DESCRIPTION
        The Set-ITGlueFlexibleAssetType cmdlet updates the details of an
        existing flexible asset type in your account

        Any attributes you don't specify will remain unchanged

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ID
        A valid flexible asset id in your account

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Set-ITGlueFlexibleAssetType -id 8765309 -Data $JsonObject

        Update a flexible asset type with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetTypes/Set-ITGlueFlexibleAssetType.html

    .LINK
        https://api.itglue.com/developer/#flexible-asset-types-update
#>

    [CmdletBinding(DefaultParameterSetName = 'Update', SupportsShouldProcess, ConfirmImpact = 'Medium')]
    [Alias('Set-ITGlueFlexibleAssetTypes')]
    Param (
        [Parameter(Mandatory = $true)]
        [int64]$ID,

        [Parameter(Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = "/flexible_asset_types/$ID"

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method PATCH -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
