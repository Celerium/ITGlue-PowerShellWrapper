function Add-ITGlueAPIKey {
<#
    .SYNOPSIS
        Sets your API key used to authenticate all API calls

    .DESCRIPTION
        The Add-ITGlueAPIKey cmdlet sets your API key which is used to
        authenticate all API calls made to ITGlue

        ITGlue API keys can be generated via the ITGlue web interface
            Account > API Keys

    .PARAMETER ApiKey
        Defines the API key that was generated from ITGlue

    .EXAMPLE
        Add-ITGlueAPIKey

        Prompts to enter in the API key

    .EXAMPLE
        Add-ITGlueAPIKey -ApiKey 'some_api_key'

        Will use the string entered into the [ -ApiKey ] parameter

    .EXAMPLE
        '12345' | Add-ITGlueAPIKey

        Will use the string passed into it as its API key

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/Internal/Add-ITGlueAPIKey.html

    .LINK
        https://github.com/itglue/powershellwrapper

#>

    [CmdletBinding()]
    [Alias('Set-ITGlueAPIKey')]
    Param (
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowEmptyString()]
        [Alias('Api_Key')]
        [string]$ApiKey
    )

    begin {}

    process{

        if ($ApiKey) {
            $x_api_key = ConvertTo-SecureString $ApiKey -AsPlainText -Force

            Set-Variable -Name "ITGlue_API_Key" -Value $x_api_key -Option ReadOnly -Scope global -Force
        }
        else {
            Write-Output "Please enter your API key:"
            $x_api_key = Read-Host -AsSecureString

            Set-Variable -Name "ITGlue_API_Key" -Value $x_api_key -Option ReadOnly -Scope global -Force
        }

    }

    end {}

}