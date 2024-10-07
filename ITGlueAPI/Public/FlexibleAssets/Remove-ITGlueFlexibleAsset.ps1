function Remove-ITGlueFlexibleAsset {
<#
    .SYNOPSIS
        Deletes one or more a flexible assets

    .DESCRIPTION
        The Remove-ITGlueFlexibleAsset cmdlet destroys multiple or a single
        flexible asset

    .PARAMETER ID
        The flexible asset id to update

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Remove-ITGlueFlexibleAsset -id 8675309

        Deletes the defined flexible asset

    .EXAMPLE
        Remove-ITGlueFlexibleAsset -Data $JsonObject

        Deletes flexible asset defined in the structured JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssets/Remove-ITGlueFlexibleAsset.html

    .LINK
        https://api.itglue.com/developer/#flexible-assets-destroy
#>

    [CmdletBinding(DefaultParameterSetName = 'Destroy', SupportsShouldProcess, ConfirmImpact = 'High')]
    [Alias('Remove-ITGlueFlexibleAssets')]
    Param (
        [Parameter(ParameterSetName = 'Destroy', Mandatory = $true)]
        [int64]$ID,

        [Parameter(ParameterSetName = 'Bulk_Destroy', Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ($PSCmdlet.ParameterSetName) {
            'Bulk_Destroy'  { $ResourceUri = "/flexible_assets" }
            'Destroy'       { $ResourceUri = "/flexible_assets/$ID" }
        }

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method DELETE -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
