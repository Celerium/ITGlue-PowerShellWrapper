function New-ITGlueConfigurationInterface {
<#
    .SYNOPSIS
        Creates one or more configuration interfaces for a particular configuration(s)

    .DESCRIPTION
        The New-ITGlueConfigurationInterface cmdlet creates one or more configuration
        interfaces for a particular configuration(s)

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ConfigurationID
        A valid configuration ID in your account



    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGlueConfigurationInterface -ConfigurationID 8765309 -Data $JsonObject

        Creates a configuration interface for the defined configuration using the structured JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/ConfigurationInterfaces/New-ITGlueConfigurationInterface.html

    .LINK
        https://api.itglue.com/developer/#configuration-interfaces-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueConfigurationInterfaces')]
    Param (
        [Parameter()]
        [Alias('conf_id','configuration_id')]
        [int64]$ConfigurationID,

        [Parameter(Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ([bool]$ConfigurationID) {
            $true   { $ResourceUri = "/configurations/$ConfigurationID/relationships/configuration_interfaces" }
            $false  { $ResourceUri = "/configuration_interfaces" }
        }

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
