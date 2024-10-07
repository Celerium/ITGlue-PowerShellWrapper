function Add-ITGlueBaseURI {
<#
    .SYNOPSIS
        Sets the base URI for the ITGlue API connection

    .DESCRIPTION
        The Add-ITGlueBaseURI cmdlet sets the base URI which is used
        to construct the full URI for all API calls

    .PARAMETER BaseUri
        Sets the base URI for the ITGlue API connection. Helpful
        if using a custom API gateway

        The default value is 'https://api.itglue.com'

    .PARAMETER DataCenter
        Defines the data center to use which in turn defines which
        base API URL is used

        Allowed values:
        'US', 'EU', 'AU'

            'US' = 'https://api.itglue.com'
            'EU' = 'https://api.eu.itglue.com'
            'AU' = 'https://api.au.itglue.com'

    .EXAMPLE
        Add-ITGlueBaseURI

        The base URI will use https://api.itglue.com

    .EXAMPLE
        Add-ITGlueBaseURI -BaseUri 'https://my.gateway.com'

        The base URI will use https://my.gateway.com

    .EXAMPLE
        'https://my.gateway.com' | Add-ITGlueBaseURI

        The base URI will use https://my.gateway.com

    .EXAMPLE
        Add-ITGlueBaseURI -DataCenter EU

        The base URI will use https://api.eu.itglue.com

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Internal/Add-ITGlueBaseURI.html

    .LINK
        https://github.com/itglue/powershellwrapper
#>

    [CmdletBinding()]
    [Alias('Set-ITGlueBaseURI')]
    Param (
        [parameter(ValueFromPipeline)]
        [Alias('base_uri')]
        [string]$BaseUri = 'https://api.itglue.com',

        [Alias('locale','dc','data_center')]
        [ValidateSet( 'US', 'EU', 'AU')]
        [string]$DataCenter
    )

    process{

        # Trim superfluous forward slash from address (if applicable)
        if($BaseUri[$BaseUri.Length-1] -eq "/") {
            $BaseUri = $BaseUri.Substring(0,$BaseUri.Length-1)
        }

        switch ($DataCenter) {
            'US' {$BaseUri = 'https://api.itglue.com'}
            'EU' {$BaseUri = 'https://api.eu.itglue.com'}
            'AU' {$BaseUri = 'https://api.au.itglue.com'}
            Default {}
        }

        Set-Variable -Name "ITGlue_Base_URI" -Value $BaseUri -Option ReadOnly -Scope global -Force

    }

}