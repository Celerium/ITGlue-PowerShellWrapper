function Import-ITGlueModuleSetting {
<#
    .SYNOPSIS
        Imports the ITGlue BaseURI, API, & JSON configuration information to the current session

    .DESCRIPTION
        The Import-ITGlueModuleSetting cmdlet imports the ITGlue BaseURI, API, & JSON configuration
        information stored in the ITGlue configuration file to the users current session

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

    .EXAMPLE
        Import-ITGlueModuleSetting

        Validates that the configuration file created with the Export-ITGlueModuleSetting cmdlet exists
        then imports the stored data into the current users session

        The default location of the ITGlue configuration file is:
            $env:USERPROFILE\ITGlueAPI\config.psd1

    .EXAMPLE
        Import-ITGlueModuleSetting -ITGlueConfigPath C:\ITGlueAPI -ITGlueConfigFile MyConfig.psd1

        Validates that the configuration file created with the Export-ITGlueModuleSetting cmdlet exists
        then imports the stored data into the current users session

        The location of the ITGlue configuration file in this example is:
            C:\ITGlueAPI\MyConfig.psd1

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Internal/Import-ITGlueModuleSetting.html

    .LINK
        https://github.com/itglue/powershellwrapper
#>

    [CmdletBinding(DefaultParameterSetName = 'Set')]
    [Alias('Import-ITGlueModuleSettings')]
    Param (
        [Parameter()]
        [Alias('ITGlue_ConfigPath')]
        [string]$ITGlueConfigPath = $(Join-Path -Path $home -ChildPath $(if ($IsWindows -or $PSEdition -eq 'Desktop') {"ITGlueAPI"}else{".ITGlueAPI"}) ),

        [Parameter()]
        [Alias('ITGlue_ConfigFile')]
        [string]$ITGlueConfigFile = 'config.psd1'
    )

    begin {
        $ITGlueConfig = Join-Path -Path $ITGlueConfigPath -ChildPath $ITGlueConfigFile
    }

    process {

        if (Test-Path $ITGlueConfig) {
            $tmp_config = Import-LocalizedData -BaseDirectory $ITGlueConfigPath -FileName $ITGlueConfigFile

            # Send to function to strip potentially superfluous slash (/)
            Add-ITGlueBaseURI $tmp_config.ITGlue_Base_URI

            $tmp_config.ITGlue_API_Key = ConvertTo-SecureString $tmp_config.ITGlue_API_Key

            Set-Variable -Name "ITGlue_API_Key" -Value $tmp_config.ITGlue_API_Key -Option ReadOnly -Scope global -Force

            Set-Variable -Name "ITGlue_JSON_Conversion_Depth" -Value $tmp_config.ITGlue_JSON_Conversion_Depth -Scope global -Force

            Write-Verbose "ITGlueAPI Module configuration loaded successfully from [ $ITGlueConfig ]"

            # Clean things up
            Remove-Variable "tmp_config"
        }
        else {
            Write-Verbose "No configuration file found at [ $ITGlueConfig ] run Add-ITGlueAPIKey to get started."

            Add-ITGlueBaseURI

            Set-Variable -Name "ITGlue_Base_URI" -Value $(Get-ITGlueBaseURI) -Option ReadOnly -Scope global -Force
            Set-Variable -Name "ITGlue_JSON_Conversion_Depth" -Value 100 -Scope global -Force
        }

    }

    end {}

}