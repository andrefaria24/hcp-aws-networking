output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "Public VPC subnets"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "Private VPC subnets"
}

output "db_subnet_group" {
  value = aws_db_subnet_group.default
  description = "Default database subnet group"
}