# Terraform Enterprise Installation

[https://hashicorp.atlassian.net/wiki/spaces/tfsupport/pages/676792039/Terraform+Enterprise+Installation](https://hashicorp.atlassian.net/wiki/spaces/tfsupport/pages/676792039/Terraform+Enterprise+Installation)

## Replicated license
I can't create a license, do not have the permissions.  
Andrii provided one for me.  

## Create linux compute resource
AWS - eu-west-3  

Requirements
[https://www.terraform.io/enterprise/before-installing](https://www.terraform.io/enterprise/before-installing)
AWS reference architecture
[https://www.terraform.io/enterprise/before-installing/reference-architecture/aws](https://www.terraform.io/enterprise/before-installing/reference-architecture/aws)  

Instance types: [https://eu-west-3.console.aws.amazon.com/ec2/v2/home?region=eu-west-3#LaunchInstances:](https://eu-west-3.console.aws.amazon.com/ec2/v2/home?region=eu-west-3#LaunchInstances:)  

Pick m5.xlarge  

### Create key pair
![](media/2022-05-03-10-38-51.png)
Save the downloaded pem file.  
chmod 0600 on the pem file  

### Create instance

![](media/2022-05-03-10-41-10.png)

![](media/2022-05-03-10-41-29.png)

![](media/2022-05-03-10-45-07.png)

![](media/2022-05-03-10-49-38.png)

![](media/2022-05-03-10-46-08.png)

Launch instance  

SSH login  
``` 
ssh -i ../TFE-paul.pem ec2-user@13.38.229.224  
``` 
(ip will change after reboot)  

### security group
Add 8800 ingress

![](media/2022-05-03-11-02-53.png)

## Create DNS record
Go to Route 53, then hosted zones  
![](media/2022-05-03-11-06-28.png)
Click on tf-support.hashicorpdemo.com  

Click on create record  
![](media/2022-05-03-11-08-23.png)

Create records  
```
tfe-paul.tf-support.hashicorpdemo.com
```
Keep in mind that you will need to adjust the ip after a reboot of the instance.  

## Install TFE
On the cli of the instance:

``` 
sudo curl -o /tmp/install.sh https://install.terraform.io/ptfe/stable
sudo chmod +x /tmp/install.sh
sudo /tmp/install.sh
``` 

```
Enter desired number (0-1): 0
Does this machine require a proxy to access the Internet? (y/N) N
```

```
To continue the installation, visit the following URL in your browser:

  http://13.38.229.224:8800

To create an alias for the replicated cli command run the following in your current shell or log out and log back in:

  source /etc/replicated.alias
```

Follow the URL provided.  

Provide the domain created with the DNS record.  
Click Use Self-Signed Cert.  

Upload the Replicated license.  

Choose Online installation type.  

Enter a password for the Admin.  

In the Settings menu, enter an Encryption password, and provide a disk mount location.  
Click Save.  


![](media/2022-05-03-16-17-25.png)

Main app url:  
[https://tfe-paul.tf-support.hashicorpdemo.com/](https://tfe-paul.tf-support.hashicorpdemo.com/)  




---
sometimes there are issues with networking which can result in 500 errors when visiting the UI.  
replicated_network in some cases (depending from AWS region, used AI and etc) not providing correct address to bind  
run:
```
curl -sSL https://install.terraform.io/ptfe/stable | sudo bash -s disable-replicated-host-networking
```