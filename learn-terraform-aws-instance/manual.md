[https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started](https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started)

From Doormat, copy paste the CLI credentials into the terminal.  

Create a directory, go into it and create the file main.tf
```
mkdir learn-terraform-aws-instance
cd learn-terraform-aws-instance
touch main.tf
```

Added example code to main.tf.  
Note: changed region to eu-west-3.  
Note: changed the ami id to ami-0c6ebbd55ab05f070, example ami id is not available in this region. 
AMIs are region specific.    

Format the file with
```
terraform fmt
```

Validate the config with
```
terraform validate 
```

Create, type yes and hit enter when prompted
```
terraform apply
```

Inspect the state with
```
terraform show 
```
or open the raw file terraform.tfstate with an editor.  

For manually managing the state you can use
```
terraform state
```


To override a variable on the commandline use this command:
```
terraform apply -var "instance_name=YetAnotherName"
```