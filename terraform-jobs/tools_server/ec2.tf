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
  region  = var.region
}
resource "aws_instance" "tool_server" {
  ami           = data.aws_ami.server_ami.id
  instance_type = var.instance_type
  key_name = var.pem_key
  tags = {
    Name = var.tool_server_tag_name
  }
}

output "ec2_instance_ip" {
    value = aws_instance.tool_server.public_ip
}