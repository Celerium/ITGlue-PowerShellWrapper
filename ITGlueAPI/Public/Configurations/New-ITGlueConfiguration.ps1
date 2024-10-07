function New-ITGlueConfiguration {
<#
    .SYNOPSIS
        Creates one or more configurations

    .DESCRIPTION
        The New-ITGlueConfiguration cmdlet creates one or more
        configurations under a defined organization

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER OrganizationID
        A valid organization Id in your Account

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGlueConfiguration -OrganizationID 8675309 -Data $JsonObject

        Creates a configuration in the defined organization with the
        with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/Configurations/new-ITGlueConfiguration.html

    .LINK
        https://api.itglue.com/developer/#configurations-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueConfigurations')]
    Param (
        [Parameter()]
        [Alias('org_id','organization_id')]
        [int64]$OrganizationID,

        [Parameter(Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ([bool]$OrganizationID) {
            $true   { $ResourceUri = "/organizations/$OrganizationID/relationships/configurations" }
            $false  { $ResourceUri = "/configurations" }
        }

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
