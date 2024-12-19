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
