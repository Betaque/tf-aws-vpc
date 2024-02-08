# VPC Module

This module creates a Amazon Virtual Private Cloud (VPC) in AWS with customizable configurations.

### Prerequisites
- An AWS account.
- Terraform CLI installed on your local machine, you can check it, [How to Install Guideline here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### AWS Authentication 
This guide outlines the process of authenticating with AWS using Terraform through Access Key and Secret Key.

**Generate Access Key and Secret Key:**
1. Log in to your AWS Management Console.
2. Go to the IAM service.
3. Navigate to the Users section and select the user for whom you want to generate the access key and secret key.
4. Under the Security credentials tab, click on Create access key.
5. Make sure to save the access key ID and secret access key. These will be used for authentication.

### Module Configurations:
 
**1. Create a new Terraform configuration file (e.g., provider.tf) or use an existing one.**

**2. Add the following code to configure AWS provider with access key and secret key:**

```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region     = "us-west-2"  # Replace with your desired AWS region
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}
```
Replace **YOUR_ACCESS_KEY** and **YOUR_SECRET_KEY** with the access key ID and secret access key generated in the previous step.

or you can export your access_key and secret_key on your local machine.
```
export access_key="YOUR_ACCESS_KEY"
export secret_key="YOUR_SECRET_KEY"
```

**3. Add VPC Module and Define Variables:**


Add the VPC Module to your main.tf file and fill in the variables in variables.tf with the values you need. Just replace the example values with your own settings.

**For Example:-**

```
module "vpc" {
  source                                = "git::https://github.com/Betaque/tf-aws-vpc.git//?ref=feat/generic-vpc" # Path of the Module
  vpc_cidr                              = "10.0.0.0/16"
  vpc_name                              = "vpc-1"
  aws_public_subnets= [
    {
      name                              = "public-subnet-1",
      cidr                              = "10.0.0.0/20",
      availability_zones                = "us-east-1a"
    },
    {
      name                              = "public-subnet-2",
      cidr                              = "10.0.16.0/20",
      availability_zones                = "us-east-1b"
    }
    # Add more subnets as needed
  ]
  aws_private_subnets= [
    {
      name                              = "private-subnet-1",
      cidr                              = "10.0.32.0/20",
      availability_zones                = "us-east-1c"
    }
    # Add more subnets as needed
  ]
  aws_internet_gateway_name             = "igw-east1"
  aws_nat_gateway_name                  = "nat-east1"
  aws_private_route_table_name          = "route-table-private-east1"
  aws_public_route_table_name           = "route-table-public-east1"
}
```

**4. Initialize Terraform:** 

Open a terminal and navigate to the directory containing your Terraform configuration file.

Run the following command to initialize Terraform:
```
terraform init
```

**5. Apply Terraform Configuration:** 

After initializing, you can now apply the Terraform configuration to authenticate with AWS:
```
terraform apply
``` 
