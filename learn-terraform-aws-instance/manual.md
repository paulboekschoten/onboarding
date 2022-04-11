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

View outputs with the following command:
```
terraform output <variable>
```

## Store remote state
Retrieve the organisation id from your Terraform Cloud account.  

Add the following code in the terraform block
```json
cloud {
    organization = "paulboekschoten-business"
    workspaces {
      name = "getting-started-aws"
    }
  }
```

Login to terraform cloud with:
```
terraform login
```
This redirects you to a browser where you can copy the token.  
Paste this on the CLI. 

Run
```
terraform init
```
You will be prompted to migrate the current state, answer YES.  

In your Terraform cloud account you will now see your workspace in your organisation.  

Remove the local state file
```
rm terraform.tfstate
```

Add the AWS environment variables (Doormat) to your Terraform cloud workspace.  
Push them with doormat CLI like this:
```
doormat aws --account support_terraform_dev tf-push --workspace getting-started-aws --organization paulboekschoten-business
```
Adding the variables in the cloud console by hand will probably end up with a copy paste error and leading to a 403 unauthorized error.  
