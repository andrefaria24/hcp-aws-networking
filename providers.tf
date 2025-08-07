provider "tfe" {
  token = var.TFE_TOKEN
}

provider "aws" {
  region = "us-east-2"
}