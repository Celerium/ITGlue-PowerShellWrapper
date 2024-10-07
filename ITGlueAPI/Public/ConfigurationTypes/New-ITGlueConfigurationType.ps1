function New-ITGlueConfigurationType {
<#
    .SYNOPSIS
        Creates a configuration type

    .DESCRIPTION
        The New-ITGlueConfigurationType cmdlet creates a new configuration type

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGlueConfigurationType -Data $JsonObject

        Creates a new configuration type with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/ConfigurationTypes/New-ITGlueConfigurationType.html

    .LINK
        https://api.itglue.com/developer/#configuration-types-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueConfigurationTypes')]
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

        $ResourceUri = '/configuration_types'

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
