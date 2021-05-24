param(
    $ResourceGroupName,
    $Environment,
    $Expires,
    $OwnerName,
    $OwnerEmail,
    $PR,
    $GitSha,
    $Branch
)

$rg = Get-AzResourceGroup -Name $ResourceGroupName
$tag = @{Environment=$Environment; Expires=$Expires; Branch=$Branch; OwnerName=$OwnerName; OwnerEmail=$OwnerEmail; PRId=$PR; GitSha=$GitSha; PR='true'}
New-AZTag -ResourceId $rg.ResourceId -Tag $tag -Verbose