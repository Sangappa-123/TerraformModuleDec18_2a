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
