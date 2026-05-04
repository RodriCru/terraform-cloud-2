terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=6.38.0, <6.41.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
  required_version = "~>1.15.1"
}

provider "aws" {
  region = "us-east-2"
  access_key = var.access_key
  secret_key = var.secret_key
  default_tags {
    tags = var.tags
  }
}