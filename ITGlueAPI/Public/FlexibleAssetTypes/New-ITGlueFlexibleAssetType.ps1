function New-ITGlueFlexibleAssetType {
<#
    .SYNOPSIS
        Creates one or more flexible asset types

    .DESCRIPTION
        The New-ITGlueFlexibleAssetType cmdlet creates one or
        more flexible asset types

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGlueFlexibleAssetType -Data $JsonObject

        Creates a new flexible asset type with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/FlexibleAssetTypes/New-ITGlueFlexibleAssetType.html

    .LINK
        https://api.itglue.com/developer/#flexible-asset-types-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueFlexibleAssetTypes')]
    Param (
        [Parameter(Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = '/flexible_asset_types'

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
