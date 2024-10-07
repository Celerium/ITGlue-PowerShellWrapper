function Set-ITGluePassword {
<#
    .SYNOPSIS
        Updates one or more passwords

    .DESCRIPTION
        The Set-ITGluePassword cmdlet updates the details of an
        existing password or the details of multiple passwords

        To show passwords your API key needs to have the "Password Access" permission

        Any attributes you don't specify will remain unchanged

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER OrganizationID
        A valid organization Id in your account

    .PARAMETER ID
        Update a password by id

    .PARAMETER ShowPassword
        Define if the password should be shown or not

        By default ITGlue hides the passwords from the returned data

        Allowed values: (case-sensitive)
        'true', 'false'

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Set-ITGluePassword -id 8675309 -Data $JsonObject

        Updates the password in the defined organization with the specified JSON object

        The password is NOT returned in the results

    .EXAMPLE
        Set-ITGluePassword -id 8675309 -ShowPassword $true -Data $JsonObject

        Updates the password in the defined organization with the specified JSON object

        The password IS returned in the results

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Passwords/Set-ITGluePassword.html

    .LINK
        https://api.itglue.com/developer/#passwords-update
#>

    [CmdletBinding(DefaultParameterSetName = 'Bulk_Update', SupportsShouldProcess, ConfirmImpact = 'Medium')]
    [Alias('Set-ITGluePasswords')]
    Param (
        [Parameter(ParameterSetName = 'Update')]
        [Alias('org_id','organization_id')]
        [int64]$OrganizationID,

        [Parameter(ParameterSetName = 'Update', Mandatory = $true)]
        [int64]$ID,

        [Parameter(ParameterSetName = 'Update')]
        [ValidateSet('true', 'false', IgnoreCase = $false)]
        [Alias('show_Password')]
        [string]$ShowPassword,

        [Parameter(ParameterSetName = 'Update', Mandatory = $true)]
        [Parameter(ParameterSetName = 'Bulk_Update', Mandatory = $true)]
        $Data
    )

    begin {

        $FunctionName       = $MyInvocation.InvocationName
        $ParameterName      = $functionName + '_Parameters'      -replace '-','_'
        $QueryParameterName = $functionName + '_ParametersQuery' -replace '-','_'

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ($PSCmdlet.ParameterSetName) {
            'Bulk_Update'  { $ResourceUri = "/passwords" }
            'Update'       {

                switch ([bool]$OrganizationID) {
                    $true   { $ResourceUri = "/organizations/$OrganizationID/relationships/passwords/$ID" }
                    $false  { $ResourceUri = "/passwords/$ID" }
                }

            }
        }

        $query_params = @{ 'show_password'= $ShowPassword }

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $query_params -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method PATCH -ResourceURI $ResourceUri -QueryParams $query_params -Data $Data
        }

    }

    end {}

}
