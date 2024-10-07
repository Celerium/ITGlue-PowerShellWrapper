function New-ITGlueContactType {
<#
    .SYNOPSIS
        Create a new contact type

    .DESCRIPTION
        The New-ITGlueContactType cmdlet creates a new contact type in
        your account

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGlueContactType -Data $JsonObject

        Creates a new contact type with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/ContactTypes/New-ITGlueContactType.html

    .LINK
        https://api.itglue.com/developer/#contact-types-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueContactTypes')]
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

        $ResourceUri = '/contact_types'

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data
        }

    }

    end {}

}
