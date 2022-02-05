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
  default_tags {
    tags = {
      Owner = var.owner
    }
  }
}

data "aws_ami" "image" {
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "test-nginx" {
  ami = data.aws_ami.image.image_id
  instance_type = "t2.micro"
  user_data = <<EOF
#! /bin/bash
amazon-linux-extras install -y nginx1
sleep 2
systemctl enable nginx
sleep 2
systemctl start nginx
EOF
  tags = {
    Name = "terraform-homework-instance"
  }
}

resource "aws_db_instance" "test-database" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0.27"
  instance_class       = "db.t2.micro"
  name                 = "database1"
  username             = var.db_user
  password             = var.db_password
  skip_final_snapshot  = true
  backup_retention_period = 0
  tags = {
    Name = "terraform-homework-rds"
  }
}
