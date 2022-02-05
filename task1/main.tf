terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.region
}

data "aws_vpcs" "all_vpcs" {}

data "aws_subnets" "all_subnets" {}

data "aws_security_groups" "all_sg" {
  filter {
    name   = "vpc-id"
    values = [ "*" ]
  }
}
