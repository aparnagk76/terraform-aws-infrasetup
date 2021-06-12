terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend s3 {
    bucket = "aparna-terraform-state"
    key    = "infra-setup/state"
    region = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"
}