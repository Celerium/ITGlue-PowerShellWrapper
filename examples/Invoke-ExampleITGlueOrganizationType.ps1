<#
    .SYNOPSIS
        Populates example data using the ITGlueAPI module

    .DESCRIPTION
        The Invoke-ExampleITGlueOrganizationType script populates example
        data using the various methods available to an endpoint

        By default on the first run this script will create 3 new organization
        types in the ITGlue tenant.

        If a organization type already exists then it name is updated

        As of 2024-09-28, the organization type endpoint does not support
        deletion so you will have to manually delete the organization
        type from ITGlue

        Unless the -Verbose parameter is used, no output is displayed while the script runs

    .PARAMETER APIKey
        Defines the APIKey used to authenticate to ITGlue

    .PARAMETER APIUri
        Defines the base uri to use when making API calls

    .PARAMETER ExamplesToMake
        Defines how many examples to make

    .EXAMPLE
        .\Invoke-ExampleITGlueOrganizationType.ps1 -Verbose

        Checks for existing organization types and either updates or creates new example
        organization catagories

        API calls are made individually, so if 3 examples are made then 3 API calls are made

        Progress information is sent to the console while the script is running

    .NOTES
        N/A

    .INPUTS
        N/A

    .OUTPUTS
        Console

    .LINK
        https://api.itglue.com/developer/#organization-types

    .LINK
        https://github.com/itglue/powershellwrapper
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
        [string]$APIKey,

        [Parameter()]
        [string]$APIUri,

        [Parameter()]
        [ValidateRange(1, 5)]
        [int64]$ExamplesToMake = 3

    )

#EndRegion  [ Parameters ]

    Write-Verbose ''
    Write-Verbose "START - $(Get-Date -Format yyyy-MM-dd-HH:mm) - Using the [ $($PSCmdlet.ParameterSetName) ] parameterSet"
    Write-Verbose ''
    Write-Verbose " - (0/3) - $(Get-Date -Format MM-dd-HH:mm) - Setting up prerequisites"

#Region     [ Prerequisites ]

    $FunctionName   = $MyInvocation.MyCommand.Name -replace '.ps1' -replace '-','_'
    $StepNumber     = 1
    $ExampleName    = 'ExampleOrganizationType'

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

    Write-Verbose " - ($StepNumber/3) - $(Get-Date -Format MM-dd-HH:mm) - Find existing examples"
    $StepNumber++

#Region     [ Find Existing Data ]

    #Check if examples are present
    $CurrentOrganizationTypes = (Get-ITGlueOrganizationType -AllResults).data | Where-Object {$_.attributes.name -like "$ExampleName*"}
    if ($CurrentOrganizationTypes) {
        Write-Verbose " -       - $(Get-Date -Format MM-dd-HH:mm) - Found [ $(($CurrentOrganizationTypes| Measure-Object).Count) ] existing organization types"
    }

#EndRegion  [ Find Existing Data ]

Write-Verbose " - ($StepNumber/3) - $(Get-Date -Format MM-dd-HH:mm) - Populate examples"
$StepNumber++

#Region     [ Example Code ]

    #Example values
    $ExampleNumber      = 1

    #Stage array lists to store example data
    $ExampleReturnData      = [System.Collections.Generic.List[object]]::new()

    #Loop to create example data
    while($ExampleNumber -le $ExamplesToMake) {

        $ExampleOrganizationType = "$ExampleName-$ExampleNumber"

        $ExistingOrganizationType = $CurrentOrganizationTypes | Where-Object {$_.attributes.name -like "$ExampleOrganizationType*"}

        if ($ExistingOrganizationType) {

            Write-Verbose " -       - $(Get-Date -Format MM-dd-HH:mm) - Updating organization type [ $($ExistingOrganizationType.attributes.name) | $($ExistingOrganizationType.id) ]"

            #Simple field updates
            $UpdatedHashTable = @{
                type        = 'organization-types'
                attributes = @{
                    name = "$ExampleOrganizationType-Updated-$(Get-Date -Format 'yyyy-MM-dd-HH:mm:ss')"
                }
            }

            $OrgTypeReturn = Set-ITGlueOrganizationType -ID $ExistingOrganizationType.id -Data $UpdatedHashTable
            $ExampleReturnData.Add($OrgTypeReturn) > $null

        }
        else {

            Write-Verbose " -       - $(Get-Date -Format MM-dd-HH:mm) - New organization type [ $ExampleOrganizationType ]"

            #Example Hashtable with new information
            $NewHashTable = @{
                type        = 'organization-types'
                attributes = @{
                    name = "$ExampleOrganizationType"
                }
            }

            $OrgTypeReturn = New-ITGlueOrganizationType -Data $NewHashTable
            $ExampleReturnData.Add($OrgTypeReturn) > $null

        }

        #Clear hashtable's for the next loop
        $UpdatedHashTable   = $null
        $NewHashTable       = $null

        $ExampleNumber++

    }
    #End of Loop

#EndRegion  [ Example Code ]

    Write-Warning " -       - $(Get-Date -Format MM-dd-HH:mm) - You will have to manually delete [ $(($ExampleReturnData.data | Measure-Object).Count) ] organization types from ITGlue"

    #Helpful global troubleshooting variable
    Set-Variable -Name "$($FunctionName)_Return" -Value $ExampleReturnData -Scope Global -Force

    $ExampleReturnData

    Write-Verbose " - ($StepNumber/3) - $(Get-Date -Format MM-dd-HH:mm) - Done"

Write-Verbose ''
Write-Verbose "END - $(Get-Date -Format yyyy-MM-dd-HH:mm)"
Write-Verbose ''