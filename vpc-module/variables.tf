variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "A list of CIDR blocks for the subnets"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch for subnets"
  type        = bool
  default     = false
}
