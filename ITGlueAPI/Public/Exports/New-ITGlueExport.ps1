function New-ITGlueExport {
<#
    .SYNOPSIS
        Creates a new export

    .DESCRIPTION
        The New-ITGlueExport cmdlet creates a new export
        in your account

        The new export will be for a single organization if organization_id is specified;
        otherwise the new export will be for all organizations of the current account

        The actual export attachment will be created later after the export record is created
        Please check back using show endpoint, you will see a downloadable url when the record shows done

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER OrganizationID
        A valid organization Id in your account

        If not defined then the entire ITGlue account is exported

    .PARAMETER IncludeLogs
        Define if logs should be included in the export

    .PARAMETER ZipPassword
        Password protect the export

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGlueExport -Data $JsonObject

        Creates a new export with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://celerium.github.io/ITGlue-PowerShellWrapper/site/Exports/New-ITGlueExport.html

    .LINK
        https://api.itglue.com/developer/#exports-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create',SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueExports')]
    Param (
        [Parameter(ParameterSetName = 'Custom_Create')]
        [Alias('org_id','organization_id')]
        [int64]$OrganizationID,

        [Parameter(ParameterSetName = 'Custom_Create')]
        [Alias('include_logs')]
        [switch]$IncludeLogs,

        [Parameter(ParameterSetName = 'Custom_Create')]
        [ValidateNotNullOrEmpty()]
        [Alias('zip_password')]
        [string]$ZipPassword,

        [Parameter(ParameterSetName = 'Create',Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        $ResourceUri = '/exports'

        if ($PSCmdlet.ParameterSetName -eq 'Custom_Create') {

            if ($OrganizationID -eq 0) {
                $ConfirmPreference = 'low'
                Write-Warning 'Exporting entire ITGlue account'
            }

            $Data = @{
                type = 'exports'
                attributes = @{
                    'organization-id'   = if ($OrganizationID) {$OrganizationID}else{$null}
                    'include-logs'      = if ($IncludeLogs) {'True'}else{$null}
                    'zip-password'      = if ($ZipPassword) {$ZipPassword}else{$null}
                }
            }

        }

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data
        }

    }

    end{}

}
