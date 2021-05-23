param(
    $ResourceGroupName,
    $SiteName
)

$RestMethodParameters = @{
    SubscriptionId = ((get-azcontext).subscription.id)
    ResourceGroupName = $ResourceGroupName
    ResourceProviderName = 'Microsoft.Web'
    ResourceType = 'staticSites'
    Name = "${SiteName}/listsecrets"
    ApiVersion = "2019-08-01"
    Method = 'POST'
}

$ApiKey = ''

Try{
    $ApiKey  = invoke-AzRestMethod @RestMethodParameters | 
    Select-Object -ExpandProperty Content |
    ConvertFrom-Json |
    Select-Object -ExpandProperty properties |
    Select-Object -ExpandProperty ApiKey
}
Catch{
    # If something went wrong its likely the resource does not yet exist.  With an empty API key the pipeline will attempt to create resources.
    
}

Write-Host "##vso[task.setvariable variable=token;issecret=true]$ApiKey"