function Remove-ITGlueBaseURI {
<#
    .SYNOPSIS
        Removes the ITGlue base URI global variable

    .DESCRIPTION
        The Remove-ITGlueBaseURI cmdlet removes the ITGlue base URI from
        the global variable

    .EXAMPLE
        Remove-ITGlueBaseURI

        Removes the ITGlue base URI value from the global variable

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Remove-ITGlueBaseURI.html

    .LINK
        https://github.com/Celerium/ITGlue-PowerShellWrapper
#>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'None')]
    Param ()

    begin {}

    process {

        switch ([bool]$ITGlue_Base_URI) {

            $true   {
                if ($PSCmdlet.ShouldProcess('ITGlue_Base_URI')) {
                    Remove-Variable -Name "ITGlue_Base_URI" -Scope global -Force
                }
            }

            $false  { Write-Warning "The ITGlue base URI variable is not set. Nothing to remove" }

        }

    }

    end {}

}