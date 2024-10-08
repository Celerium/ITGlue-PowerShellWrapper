<#
    .SYNOPSIS
        Pulls an ITGlue Operating System

    .DESCRIPTION
        The Invoke-ExampleITGlueRegion script pulls a
        defined or random ITGlue operating system

        By default a random operating system is pulled

        Unless the -Verbose parameter is used, no output is displayed while the script runs

    .PARAMETER APIKey
        Defines the APIKey used to authenticate to ITGlue

    .PARAMETER APIUri
        Defines the base uri to use when making API calls

    .PARAMETER ID
        ID of the Operating System

    .EXAMPLE
        .\Invoke-ExampleITGlueOperatingSystem.ps1 -Verbose

        Pulls a random Operating System from ITGlue and displays results

        Progress information is sent to the console while the script is running

    .EXAMPLE
        .\Invoke-ExampleITGlueOperatingSystem.ps1 -ID 12345

        Pulls the defined Operating System and displays the results

        No progress information is sent to the console while the script is running

    .NOTES
        N/A

    .INPUTS
        N/A

    .OUTPUTS
        Console

    .LINK
        https://api.itglue.com/developer/#operating-systems

    .LINK
        https://github.com/Celerium/ITGlue-PowerShellWrapper
#>

<############################################################################################
                                        Code
############################################################################################>
#Requires -Version 3.0
<# #Requires -Modules @{ ModuleName='ITGlueAPI'; ModuleVersion='2.2.0' } #>

#Region     [ Parameters ]

    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$APIKey,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$APIUri,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int64]$ID

    )

#EndRegion  [ Parameters ]

    Write-Verbose ''
    Write-Verbose "START - $(Get-Date -Format yyyy-MM-dd-HH:mm) - Using the [ $($PSCmdlet.ParameterSetName) ] parameterSet"
    Write-Verbose ''
    Write-Verbose " - (0/2) - $(Get-Date -Format MM-dd-HH:mm) - Setting up prerequisites"

#Region     [ Prerequisites ]

    $FunctionName   = $MyInvocation.MyCommand.Name -replace '.ps1' -replace '-','_'
    $StepNumber     = 1

    Import-Module ITGlueAPI -Verbose:$false

    #Setting up ITGlue APIKey & BaseURI
    try {

        if ($APIKey) { Add-ITGlueAPIKey $APIKey }
        if([bool]$(Get-ITGlueAPIKey -WarningAction SilentlyContinue) -eq $false) {
            Throw "The ITGlue API [ secret ] key is not set. Run Add-ITGlueAPIKey to set the API key."
        }

        if ($APIUri) { Add-ITGlueBaseURI -BaseUri $APIUri }
        if([bool]$(Get-ITGlueBaseURI -WarningAction SilentlyContinue) -eq $false) {
            Add-ITGlueBaseURI
            Write-Verbose " -       - $(Get-Date -Format MM-dd-HH:mm) - Using [ $(Get-ITGlueBaseURI) ]"
        }

    }
    catch {
        Write-Error $_
        exit 1
    }


#EndRegion  [ Prerequisites ]

    Write-Verbose " - ($StepNumber/2) - $(Get-Date -Format MM-dd-HH:mm) - Finding Operating System"
    $StepNumber++

#Region     [ Main Code ]

try {

    if ($ID) {

        $ExampleReturnData = (Get-ITGlueOperatingSystem -ID $ID).data

        if ($null -eq $ExampleReturnData.id) {
            Throw "No Operating System found with an ID of [ $ID ], please verify Operating System ID and try again"
        }

    }
    else{

        $TotalOperatingSystems  = (Get-ITGlueOperatingSystem -PageSize 1).meta.'total-count'
        $ExampleReturnData      = (Get-ITGlueOperatingSystem -ID $( 1..$TotalOperatingSystems | Get-Random -Count 1 )).data

        if ($null -eq $ExampleReturnData.id) {
            Throw "No Operating System found, please verify ITGlue Operating Systems and try again"
        }

    }

    Write-Verbose " -       - $(Get-Date -Format MM-dd-HH:mm) - Found Operating System [ $($ExampleReturnData.attributes.name) - $($ExampleReturnData.id) ]"

    #Helpful global troubleshooting variable
    Set-Variable -Name "$($FunctionName)_Return" -Value $ExampleReturnData -Scope Global -Force

    $ExampleReturnData

}
catch {
    Write-Error $_
    exit 1
}

#EndRegion  [ Main Code ]

Write-Verbose " - ($StepNumber/2) - $(Get-Date -Format MM-dd-HH:mm) - Done"

Write-Verbose ''
Write-Verbose "END - $(Get-Date -Format yyyy-MM-dd-HH:mm)"
Write-Verbose ''