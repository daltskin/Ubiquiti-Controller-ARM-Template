# Ubiquiti-Controller-ARM-Template

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdaltskin%2FUbiquiti-Controller-ARM-Template%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fdaltskin%2FUbiquiti-Controller-ARM-Template%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template allows you to deploy the necessary infrastructure to run a Ubiquiti Controller. 
It opens up the necessary firewall ports [https://help.ubnt.com/hc/en-us/articles/218506997].  It will also install the Unifi controller software and it's dependencies.

This will deploy a A1 Basic size VM in the resource group location, and use the Unifi Controller installation scripts provided by [Glenn Rietveld](https://GlennR.nl).

The entire provisioning process will take ~12 minutes.  To access the Unifi Controller the url will be in the format: https://{dnsName}.{region}.cloudapp.azure.com

## Installing Unifi Controller (Manual)

The ARM template will execute the installation script as part of the provisioning process of the virtual machine.  However, if you need to run this manually for any reason the [./Install.sh] provides an example.

## Register APs to controller

If your APs are already registered to a controller, ensure they are forgotten on that controller and re-assign them to the new one.  You'll need to be on the same network as them to update them with the new inform address.  You can do this by SSH into the AP using default credentials (ubnt/ubnt) eg:

```
ssh ubnt@192.168.1.90
syswrapper.sh restore-default
set-inform http://[FQDN]:8080/inform
```
