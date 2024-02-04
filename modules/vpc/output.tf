# outputs.tf

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "network_acl_id" {
  value = aws_network_acl.nacl.id
}

output "vpc_cidr_block" {

  value = var.vpc_cidr_block
  
}
