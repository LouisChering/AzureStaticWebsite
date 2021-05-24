param(
    $ResourceGroupName,
    $Environment,
    $Expires,
    $OwnerName,
    $OwnerEmail,
    $PR,
    $GitSha
)

$rg = Get-AzResourceGroup -Name $ResourceGroupName
$tag = @{Environment=$Environment; Expires=$Expires; OwnerName=$OwnerName; OwnerEmail=$OwnerEmail; PRId=$PR; GitSha=$GitSha; PR='true'}
New-AZTag -ResourceId $rg.ResourceId -Tag $tag -Verbose