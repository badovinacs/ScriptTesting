Param($StorageAccountName, $NumDays, $ResourceGroupName)

$storageAccount = Get-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName

if ($storageAccount.KeyCreationTime.Key1 -eq $null -or $storageAccount.KeyCreationTime.Key2 -eq $null)
{
    Write-Host("You must regenerate both keys at least once before setting expiration policy")
}
else
{
    $storageAccount = Set-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName  -KeyExpirationPeriodInDays $NumDays
    #Write-Host $account.StorageAccountName "access key expiration period successfully updated to" $NumDays "days"
}