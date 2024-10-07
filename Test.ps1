function Test-FunctionName {
    [CmdletBinding(DefaultParameterSetName = 'Create', SupportsShouldProcess, ConfirmImpact = 'Low')]
    [Alias('New-ITGlueAttachments')]
    Param (
        [Parameter()]
        [ValidateSet(   'checklists', 'checklist_templates', 'configurations', 'contacts',
                        'documents','domains', 'locations', 'passwords', 'ssl_certificates',
                        'flexible_assets', 'tickets'
        )]
        [string]$ResourceType,

        [Parameter()]
        [int64]$IntID,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$StringID,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Data
    )

    begin {

    }

    process {

        Write-Verbose "[ $FunctionName ] - Running the [ $($PSCmdlet.ParameterSetName) ] parameterSet"

        switch ([bool]$ResourceType){
            $true   { Write-Host "ResourceType - I have a value of - [ $ResourceType ]" }
            $false  { Write-Host "ResourceType - I DON'T have a value - [ $ResourceType ]" }
        }

        switch ([bool]$IntID){
            $true   { Write-Host "IntID - I have a value of - [ $IntID ]" }
            $false  { Write-Host "IntID - I DON'T have a value - [ $IntID ]" }
        }

        switch ([bool]$StringID){
            $true   { Write-Host "StringID - I have a value of - [ $StringID ]" }
            $false  { Write-Host "StringID - I DON'T have a value - [ $StringID ]" }
        }

        $query_params = @{}

        #Region     [ Parameter Translation ]

            Write-Host '          Query Params'

            if ($ResourceType) { $query_params['ResourceType'] = $ResourceType }
            else{Write-Host "The ResourceType is empty - [ $ResourceType ]"}

            if ($IntID) { $query_params['IntID'] = $IntID }
            else{Write-Host "The IntID is empty - [ $IntID ]"}

            if ($StringID) { $query_params['ResourceType'] = $StringID }
            else{
                Write-Host "The StringID is empty - [ $StringID ]"
                Write-Host "String is null - [ $( ($null -eq $StringID) ) ]"
                Write-Host "String is NOT null - [ $( ($null -ne $StringID) ) ]"
            }

            $query_params

    }

    end {

    }
}