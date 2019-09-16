cls
$RGName = "RG-Test1";
$DeployLocation = "West Europe";
$ARMTemplate = "C:\@SourceControl\Github\Ubiquiti-Controller-ARM-Template\AzureDeploy.json"
$dnsLabelPrefix = "myUnifiVM"
$adminUsername = "UbntAdmin"
$adminPassword = "Password123"

# 1. Login
Login-AzureRmAccount

#2. Create a resource group
New-AzureRmResourceGroup -Name $RGName -Location $DeployLocation -Force

#3. Create resources within RG
New-AzureRmResourceGroupDeployment `
    -ResourceGroupName $RGName `
    -TemplateFile $ARMTemplate `
    -TemplateParameterObject @{ dnsLabelPrefix = $dnsLabelPrefix; adminUsername = $adminUsername; adminPassword = $adminPassword} `
    -AsJob `
    -Mode Complete -Force



