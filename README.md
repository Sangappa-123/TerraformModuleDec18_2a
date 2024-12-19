# VPC Module

This module creates a Virtual Private Cloud (VPC) in AWS with associated subnets, route tables, and an internet gateway.

## Inputs

| Name                   | Description                         | Type   | Default | Required |
|------------------------|-------------------------------------|--------|---------|----------|
| vpc_name               | The name of the VPC                | string | n/a     | yes      |
| vpc_cidr               | The CIDR block for the VPC         | string | n/a     | yes      |
| subnet_cidrs           | A list of CIDR blocks for subnets  | list   | n/a     | yes      |
| map_public_ip_on_launch| Map public IP on launch for subnets| bool   | false   | no       |

## Outputs

| Name                | Description                     |
|---------------------|---------------------------------|
| vpc_id              | The ID of the created VPC      |
| subnet_ids          | The IDs of the created subnets |
| internet_gateway_id | The ID of the internet gateway |

## Usage
```hcl
module "vpc" {
  source                = "./vpc-module"
  vpc_name              = "my-vpc"
  vpc_cidr              = "10.0.0.0/16"
  subnet_cidrs          = ["10.0.1.0/24", "10.0.2.0/24"]
  map_public_ip_on_launch = true
}
```
```

# Task 2: Implement Module Versioning

To publish and version the module:
1. Publish the module to a private registry or store it in a version-controlled repository.
2. Tag the version using Git (e.g., `git tag v1.0.0`).
3. Reference the specific version in the Terraform configuration:

```hcl
module "vpc" {
  source  = "git::ssh://git@your-repo-url.git//vpc-module?ref=v1.0.0"
  vpc_name = "my-vpc"
  vpc_cidr = "10.0.0.0/16"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  map_public_ip_on_launch = true
}
```

# Task 3: Module Composition

### Higher-Level Module Directory Structure
```
high-level-module/
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
```

### main.tf
```hcl
module "vpc" {
  source = "../vpc-module"

  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  subnet_cidrs          = var.subnet_cidrs
  map_public_ip_on_launch = var.map_public_ip_on_launch
}

module "ec2" {
  source = "../ec2-module"
  vpc_id = module.vpc.vpc_id
}

module "rds" {
  source = "../rds-module"
  vpc_id = module.vpc.vpc_id
}

