output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = aws_subnet.subnet[*].id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}
