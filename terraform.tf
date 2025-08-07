terraform {
  required_version = "~>1.12.0"

  cloud {
    organization = "acfaria-hashicorp"

    workspaces {
      name = "aws-networking"
    }
  }

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.68.2"
    }
  }
}