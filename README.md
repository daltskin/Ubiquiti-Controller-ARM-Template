# Ubiquiti-Controller-ARM-Template

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdaltskin%2FUbiquiti-Controller-ARM-Template%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fdaltskin%2FUbiquiti-Controller-ARM-Template%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template allows you to deploy the necessary infrastructure to run a Ubiquiti Controller. 
It opens up the necessary firewall ports [https://help.ubnt.com/hc/en-us/articles/218506997]

This will deploy a A1 Basic size VM in the resource group location and return the FQDN of the VM.

## Installing Unifi Controller

You'll then need to SSH onto the machine and install Unifi Controller.  Easiest way is to use Glenn Rietveld's latest scripts from here: [https://community.ui.com/questions/UniFi-Installation-Scripts-or-UniFi-Easy-Update-Script-or-Ubuntu-16-04-18-04-18-10-19-04-and-19-10-/ccbc7530-dd61-40a7-82ec-22b17f027776] eg:

```
wget https://get.glennr.nl/unifi/5.11.39/U1604/unifi-5.11.39.sh
chmod +x unifi-5.11.39.sh
sudo ./unifi-5.11.39.sh
```

Once the scripts have finished running you can disable the SSH port

## Register Access Points to controller

If your APs are already registered to a controller, ensure they are forgotten on that controller and re-assign them to the new one.  You'll need to be on the same network as them to update them with the new inform address.  You can do this by SSH into the AP using default credentials (ubnt/ubnt) eg:

```
ssh ubnt@192.168.1.90
syswrapper.sh restore-default
set-inform http://[FQDN]:8080/inform
```
