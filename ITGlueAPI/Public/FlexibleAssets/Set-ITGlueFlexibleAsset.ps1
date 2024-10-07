function Set-ITGlueFlexibleAsset {
<#
    .SYNOPSIS
        Updates one or more flexible assets

    .DESCRIPTION
        The Set-ITGlueFlexibleAsset cmdlet updates one or more flexible assets

        Any traits you don't specify will be deleted
        Passing a null value will also delete a trait's value

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ID
        The flexible asset id to update

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Set-ITGlueFlexibleAsset -id 8675309 -Data $JsonObject

        Updates a defined flexible asset with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssets/Set-ITGlueFlexibleAsset.html

    .LINK
        https://api.itglue.com/developer/#flexible-assets-update
#>

    [CmdletBinding(DefaultParameterSetName = 'Bulk_Update', SupportsShouldProcess, ConfirmImpact = 'Medium')]
    [Alias('Set-ITGlueFlexibleAssets')]
    Param (
        [Parameter(ParameterSetName = 'Update', Mandatory = $true)]
        [int64]$ID,

        [Parameter(ParameterSetName = 'Update', Mandatory = $true)]
        [Parameter(ParameterSetName = 'Bulk_Update', Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ($PSCmdlet.ParameterSetName) {
            'Bulk_Update'   { $ResourceUri = "/flexible_assets" }
            'Update'        { $ResourceUri = "/flexible_assets/$ID" }
        }

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method PATCH -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
