data "aws_ami" "server_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["golden_image_ami222"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"]
}


data "aws_iam_role" "master_server_iam_role" {
  name = "test_role"
}

data "aws_iam_instance_profile" "master_server_iam_profile" {
  name = "test_role"
}

data "template_file" "bootstrap_file" {
  template = file("${path.module}/${"bootstrap"}.txt")
}