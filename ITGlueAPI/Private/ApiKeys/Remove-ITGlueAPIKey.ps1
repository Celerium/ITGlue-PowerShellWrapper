function Remove-ITGlueAPIKey {
<#
    .SYNOPSIS
        Removes the ITGlue API key

    .DESCRIPTION
        The Remove-ITGlueAPIKey cmdlet removes the ITGlue API key from
        global variable

    .EXAMPLE
        Remove-ITGlueAPIKey

        Removes the ITGlue API key global variable

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Internal/Remove-ITGlueAPIKey.html

    .LINK
        https://github.com/itglue/powershellwrapper

#>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'None')]
    Param ()

    begin {}

    process {

        switch ([bool]$ITGlue_API_Key) {

            $true   {
                if ($PSCmdlet.ShouldProcess('ITGlue_API_Key')) {
                Remove-Variable -Name "ITGlue_API_Key" -Scope global -Force }
            }

            $false  { Write-Warning "The ITGlue API [ secret ] key is not set. Nothing to remove" }

        }

    }

    end {}

}