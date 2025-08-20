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

# Create DB subnet group
resource "aws_db_subnet_group" "db" {
  name       = "db"
  subnet_ids = module.vpc.private_subnets
}

# Create Postgresql security group
resource "aws_security_group" "postgresql" {
  name   = "postgresql"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}