provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-1212"
    key            = "module/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}

module "high-level-module" {
  source                = "./high-level-module"
  vpc_name              = "my-vpc"
  vpc_cidr              = "10.0.0.0/16"
  subnet_cidrs          = ["10.0.1.0/24", "10.0.2.0/24"]
  map_public_ip_on_launch = true
}
