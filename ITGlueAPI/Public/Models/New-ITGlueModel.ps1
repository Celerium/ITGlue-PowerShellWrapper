function New-ITGlueModel {
<#
    .SYNOPSIS
        Creates one or more models

    .DESCRIPTION
        The New-ITGlueModel cmdlet creates one or more models
        in your account or for a particular manufacturer

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ManufacturerID
        The manufacturer id to create the model under

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGlueModel -Data $JsonObject

        Creates a new model with the specified JSON object

    .EXAMPLE
        New-ITGlueModel -ManufacturerID 8675309 -Data $JsonObject

        Creates a new model associated to the defined model with the
        structured JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Models/Get-ITGlueModel.html

    .LINK
        https://api.itglue.com/developer/#models-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueModels')]
    Param (
        [Parameter()]
        [Alias('manufacturer_id')]
        [int64]$ManufacturerID,

        [Parameter(Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ([bool]$ManufacturerID) {
            $true   { $ResourceUri = "/manufacturers/$ManufacturerID/relationships/models" }
            $false  { $ResourceUri = '/models' }
        }

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
