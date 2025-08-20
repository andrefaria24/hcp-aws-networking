output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "Public VPC subnets"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "Private VPC subnets"
}

output "db_subnet_group_name" {
  value       = aws_db_subnet_group.db.name
  description = "Default database subnet group"
}

output "psql_security_group_id" {
  value       = aws_security_group.postgresql.id
  description = "Postgresql security group id"
}

output "mysql_security_group_id" {
  value       = aws_security_group.mysql.id
  description = "MySQL security group id"
}