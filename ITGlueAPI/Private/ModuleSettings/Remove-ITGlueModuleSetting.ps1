function Remove-ITGlueModuleSetting {
<#
    .SYNOPSIS
        Removes the stored ITGlue configuration folder

    .DESCRIPTION
        The Remove-ITGlueModuleSetting cmdlet removes the ITGlue folder and its files
        This cmdlet also has the option to remove sensitive ITGlue variables as well

        By default configuration files are stored in the following location and will be removed:
            $env:USERPROFILE\ITGlueAPI

    .PARAMETER ITGlueConfigPath
        Define the location of the ITGlue configuration folder

        By default the configuration folder is located at:
            $env:USERPROFILE\ITGlueAPI

    .PARAMETER WithVariables
        Define if sensitive ITGlue variables should be removed as well

        By default the variables are not removed

    .EXAMPLE
        Remove-ITGlueModuleSetting

        Checks to see if the default configuration folder exists and removes it if it does

        The default location of the ITGlue configuration folder is:
            $env:USERPROFILE\ITGlueAPI

    .EXAMPLE
        Remove-ITGlueModuleSetting -ITGlueConfigPath C:\ITGlueAPI -WithVariables

        Checks to see if the defined configuration folder exists and removes it if it does
        If sensitive ITGlue variables exist then they are removed as well

        The location of the ITGlue configuration folder in this example is:
            C:\ITGlueAPI

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Internal/Remove-ITGlueModuleSetting.html

    .LINK
        https://github.com/itglue/powershellwrapper
#>

    [CmdletBinding(DefaultParameterSetName = 'Destroy',SupportsShouldProcess)]
    [Alias('Remove-ITGlueModuleSettings')]
    Param (
        [Parameter()]
        [Alias('ITGlue_ConfigPath')]
        [string]$ITGlueConfigPath = $(Join-Path -Path $home -ChildPath $(if ($IsWindows -or $PSEdition -eq 'Desktop') {"ITGlueAPI"}else{".ITGlueAPI"}) ),

        [Parameter()]
        [Alias('With_Variables')]
        [switch]$WithVariables
    )

    begin {}

    process {

        if (Test-Path $ITGlueConfigPath) {

            Remove-Item -Path $ITGlueConfigPath -Recurse -Force -WhatIf:$WhatIfPreference

            If ($WithVariables) {
                Remove-ITGlueAPIKey
                Remove-ITGlueBaseURI
            }

            if (!(Test-Path $ITGlueConfigPath)) {
                Write-Output "The ITGlueAPI configuration folder has been removed successfully from [ $ITGlueConfigPath ]"
            }
            else {
                Write-Error "The ITGlueAPI configuration folder could not be removed from [ $ITGlueConfigPath ]"
            }

        }
        else {
            Write-Warning "No configuration folder found at [ $ITGlueConfigPath ]"
        }

    }

    end {}

}