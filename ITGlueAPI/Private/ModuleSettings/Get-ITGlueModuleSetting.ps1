function Get-ITGlueModuleSetting {
<#
    .SYNOPSIS
        Gets the saved ITGlue configuration settings

    .DESCRIPTION
        The Get-ITGlueModuleSetting cmdlet gets the saved ITGlue configuration settings
        from the local system

        By default the configuration file is stored in the following location:
            $env:USERPROFILE\ITGlueAPI

    .PARAMETER ITGlueConfigPath
        Define the location to store the ITGlue configuration file

        By default the configuration file is stored in the following location:
            $env:USERPROFILE\ITGlueAPI

    .PARAMETER ITGlueConfigFile
        Define the name of the ITGlue configuration file

        By default the configuration file is named:
            config.psd1

    .PARAMETER OpenConfigFile
        Opens the ITGlue configuration file

    .EXAMPLE
        Get-ITGlueModuleSetting

        Gets the contents of the configuration file that was created with the
        Export-ITGlueModuleSetting

        The default location of the ITGlue configuration file is:
            $env:USERPROFILE\ITGlueAPI\config.psd1

    .EXAMPLE
        Get-ITGlueModuleSetting -ITGlueConfigPath C:\ITGlueAPI -ITGlueConfigFile MyConfig.psd1 -openConfFile

        Opens the configuration file from the defined location in the default editor

        The location of the ITGlue configuration file in this example is:
            C:\ITGlueAPI\MyConfig.psd1

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Get-ITGlueModuleSetting.html

    .LINK
        https://github.com/itglue/powershellwrapper
#>

    [CmdletBinding(DefaultParameterSetName = 'Index')]
    [Alias('Get-ITGlueModuleSettings')]
    Param (
        [Parameter()]
        [Alias('ITGlue_ConfigPath')]
        [string]$ITGlueConfigPath = $(Join-Path -Path $home -ChildPath $(if ($IsWindows -or $PSEdition -eq 'Desktop') {"ITGlueAPI"}else{".ITGlueAPI"}) ),

        [Parameter()]
        [Alias('ITGlue_ConfigFile')]
        [string]$ITGlueConfigFile = 'config.psd1',

        [Parameter()]
        [Alias('Open_ConfigFile')]
        [switch]$OpenConfigFile
    )

    begin {
        $ITGlueConfig = Join-Path -Path $ITGlueConfigPath -ChildPath $ITGlueConfigFile
    }

    process {

        if (Test-Path -Path $ITGlueConfig) {

            if($OpenConfigFile) {
                Invoke-Item -Path $ITGlueConfig
            }
            else{
                Import-LocalizedData -BaseDirectory $ITGlueConfigPath -FileName $ITGlueConfigFile
            }

        }
        else{
            Write-Verbose "No configuration file found at [ $ITGlueConfig ]"
        }

    }

    end {}

}