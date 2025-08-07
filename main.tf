module "vpc" {
  source  = "app.terraform.io/${var.TFE_ORG_NAME}/vpc/aws"
  version = "1.0.0"

  name = "test-environment-vpc"
  cidr = "10.124.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.124.1.0/8", "10.124.2.0/8", "10.124.3.0/8"]
  public_subnets  = ["10.124.11.0/8", "10.124.12.0/8", "10.124.13.0/8"]

  enable_nat_gateway = true
  enable_vpn_gateway = false
}