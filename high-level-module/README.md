# Higher-Level Module

This module combines multiple lower-level modules, including the VPC, EC2, and RDS modules.

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
