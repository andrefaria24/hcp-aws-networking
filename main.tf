# Define VPC
module "vpc" {
  source  = "app.terraform.io/acfaria-hashicorp/vpc/aws"
  version = "1.0.0"

  name = "test-environment-vpc"
  cidr = "10.124.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.124.1.0/24", "10.124.2.0/24", "10.124.3.0/24"]
  public_subnets  = ["10.124.11.0/24", "10.124.12.0/24", "10.124.13.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false
}

# Create RDS DB subnet group
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = module.vpc.private_subnets
}