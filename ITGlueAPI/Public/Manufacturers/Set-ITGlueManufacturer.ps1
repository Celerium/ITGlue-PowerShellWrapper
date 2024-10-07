function Set-ITGlueManufacturer {
<#
    .SYNOPSIS
        Updates a manufacturer

    .DESCRIPTION
        The New-ITGlueManufacturer cmdlet updates a manufacturer

        Returns 422 Bad Request error if trying to update an externally synced record

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ID
        The id of the manufacturer to update

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGlueManufacturer -id 8765309 -Data $JsonObject

        Updates the defined manufacturer with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/Manufacturers/Set-ITGlueManufacturer.html

    .LINK
        https://api.itglue.com/developer/#manufacturers-update
#>

    [CmdletBinding(DefaultParameterSetName = 'Update', SupportsShouldProcess, ConfirmImpact = 'Medium')]
    [Alias('Set-ITGlueManufacturers')]
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

        $ResourceUri = "/manufacturers/$ID"

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method PATCH -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
