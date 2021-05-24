param(
    $ResourceGroupName,
    $Environment,
    $PR
)

$gitsha=$(git rev-parse --short HEAD)
$gitshortsha=$(git rev-parse --short $gitsha)
$owner=$(git log -1 --pretty=format:'%an')
$ownerEmail=$(git log -1 --pretty=format:'%ae')
$branch=$(git branch --show-current)
$expires=$(date -d "+1 week" +%Y%m%d)

$rg = Get-AzResourceGroup -Name $ResourceGroupName
$tag = @{Environment=$Environment; Expires=$expires; Branch=$Branch; Owner=$owner; OwnerEmail=$ownerEmail; PRId=$PR; GitSha=$gitshortsha; PR='true'}
New-AZTag -ResourceId $rg.ResourceId -Tag $tag -Verbose