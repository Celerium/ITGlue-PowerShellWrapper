function New-ITGluePassword {
<#
    .SYNOPSIS
        Creates one or more a passwords

    .DESCRIPTION
        The New-ITGluePassword cmdlet creates one or more passwords
        under the organization specified in the ID parameter

        To show passwords your API key needs to have the "Password Access" permission

        You can create general and embedded passwords with this endpoint

        If the resource-id and resource-type attributes are NOT provided, IT Glue assumes
        the password is a general password

        If the resource-id and resource-type attributes are provided, IT Glue assumes
        the password is an embedded password

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER OrganizationID
        A valid organization Id in your account

    .PARAMETER ShowPassword
        Define if the password should be shown or not

        By default ITGlue hides the passwords from the returned data

        Allowed values: (case-sensitive)
        'true', 'false'

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        New-ITGluePassword -OrganizationID 8675309 -Data $JsonObject

        Creates a new password in the defined organization with the specified JSON object

        The password IS returned in the results

    .EXAMPLE
        New-ITGluePassword -OrganizationID 8675309 -ShowPassword $false -Data $JsonObject

        Creates a new password in the defined organization with the specified JSON object

        The password is NOT returned in the results

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Passwords/New-ITGluePassword.html

    .LINK
        https://api.itglue.com/developer/#passwords-create
#>

    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGluePasswords')]
    Param (
        [Parameter()]
        [Alias('org_id','organization_id')]
        [int64]$OrganizationID,

        [Parameter()]
        [ValidateSet('true', 'false', IgnoreCase = $false)]
        [Alias('show_password')]
        [string]$ShowPassword,

        [Parameter(Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'
        $QueryParameterName = $functionName + '_ParametersQuery' -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ([bool]$OrganizationID) {
            $true   { $ResourceUri = "/organizations/$OrganizationID/relationships/passwords" }
            $false  { $ResourceUri = "/passwords/" }
        }

        $query_params = @{}

        if ($ShowPassword) { $query_params['show_password'] = $ShowPassword}

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $query_params -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method POST -ResourceURI $ResourceUri -Data $Data -QueryParams $query_params
        }

    }

    end {}

}
