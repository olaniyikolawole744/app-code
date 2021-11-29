terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.vpc_region
}

resource "aws_vpc" "exp_vpc" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = true
  
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.exp_vpc.id

  tags = {
    Name = "vpc_igw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.exp_vpc.id

  route  {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.vpc_igw.id
      }
  
  tags = {
    Name = "public_route_table"
  }
}