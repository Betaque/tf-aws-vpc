# VPC Module

This module creates a Virtual Private Cloud (VPC) in AWS with customizable configurations.

## Usage

1. **Get Started:** Begin by creating the necessary files, provider.tf and main.tf, in your Terraform project directory.
2. **Declare Provider:** Open provider.tf and declare the AWS provider. Ensure you've configured your AWS credentials and set the desired region.
```
provider "aws" {
  region = "us-east-1" // Set your AWS region
}
```
3. **Add VPC Module and Define Variables:** Incorporate the VPC Module into your main.tf file, and set values for the variables defined in variables.tf.
For Example:-
```
module "vpc" {
  source                   = "git::https://github.com/Betaque/tf-aws-vpc.git//?ref=feat/generic-vpc" # Path of the Module
  vpc_cidr                 = "10.0.0.0/16"
  vpc_name                 = "vpc-1"
  aws_public_subnets = [
    {
      name               = "public-subnet-1",
      cidr               = "10.0.0.0/20",
      availability_zones = "us-east-1a"
    },
    {
      name               = "public-subnet-2",
      cidr               = "10.0.16.0/20",
      availability_zones = "us-east-1b"
    }
    # Add more subnets as needed
  ]
  aws_private_subnets = [
    {
      name               = "private-subnet-1",
      cidr               = "10.0.32.0/20",
      availability_zones = "us-east-1c"
    }
    # Add more subnets as needed
  ]
  aws_internet_gateway_name    = "igw-east1"
  aws_nat_gateway_name         = "nat-east1"
  aws_private_route_table_name = "route-table-private-east1"
  aws_public_route_table_name  = "route-table-public-east1"
}
```

4. **Initialize Terraform:** Run the below terraform Command to initialize the project and download the module dependencies.
```
terraform init
```

5. **Apply Changes:** Execute the below terraform Command to create the VPC infrastructure based on the specified configurations.
```
terraform apply
``` 
