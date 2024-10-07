function Set-ITGlueModel {
<#
    .SYNOPSIS
        Updates one or more models

    .DESCRIPTION
        The Set-ITGlueModel cmdlet updates an existing model or
        set of models in your account

        Bulk updates using a nested relationships route are not supported

        Returns 422 Bad Request error if trying to update an externally synced record

        Examples of JSON objects can be found under ITGlues developer documentation
            https://api.itglue.com/developer

    .PARAMETER ManufacturerID
        Update models under the defined manufacturer id

    .PARAMETER ID
        Update a model by id

    .PARAMETER FilterID
        Filter models by id

    .PARAMETER Data
        JSON object or array depending on bulk changes or not

    .EXAMPLE
        Set-ITGlueModel -id 8675309 -Data $JsonObject

        Updates the defined model with the specified JSON object

    .NOTES
        N/A

    .LINK
        https://itglue.github.io/ITGlue-PowerShellWrapper/site/Models/Get-ITGlueModel.html

    .LINK
        https://api.itglue.com/developer/#models-update
#>

    [CmdletBinding(DefaultParameterSetName = 'Bulk_Update', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('Set-ITGlueModels')]
    Param (
        [Parameter(ParameterSetName = 'Update')]
        [Alias('manufacturer_id')]
        [int64]$ManufacturerID,

        [Parameter(ParameterSetName = 'Update', Mandatory = $true)]
        [int64]$ID,

        [Parameter(ParameterSetName = 'Bulk_Update')]
        [Alias('filter_id')]
        [int64]$FilterID,

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
            'Update'        {

                switch ([bool]$ManufacturerID) {
                    $true   { $ResourceUri = "/manufacturers/$ManufacturerID/relationships/models/$ID" }
                    $false  { $ResourceUri = "/models/$ID" }
                }

            }
            'Bulk_Update'   { $ResourceUri = "/models" }

        }

        $query_params = @{}

        #Region     [ Parameter Translation ]

        if ($PSCmdlet.ParameterSetName -eq 'Bulk_Update') {
            if ($FilterID) { $query_params['filter[id]'] = $FilterID }
        }

        #EndRegion  [ Parameter Translation ]

        Set-Variable -Name $ParameterName -Value $PSBoundParameters -Scope Global -Force -Confirm:$false
        Set-Variable -Name $QueryParameterName -Value $query_params -Scope Global -Force -Confirm:$false

        if ($PSCmdlet.ShouldProcess($ResourceUri)) {
            return Invoke-ITGlueRequest -Method PATCH -ResourceURI $ResourceUri -QueryParams $query_params -Data $Data
        }

    }

    end {}

}
