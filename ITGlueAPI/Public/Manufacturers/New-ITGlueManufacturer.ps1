function New-ITGlueManufacturer {
<#
    .SYNOPSIS
        Create a new manufacturer

    .DESCRIPTION
        The New-ITGlueManufacturer cmdlet creates a new manufacturer

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGlueManufacturer -Data $JsonObject

        Creates a new manufacturers with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Manufacturers/New-ITGlueManufacturer.html

    .LINK
        https://api.itglue.com/developer/#manufacturers-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueManufacturers')]
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

        $ResourceUri = '/manufacturers/'

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}
}
