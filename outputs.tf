output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "Public VPC subnets"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "Private VPC subnets"
}