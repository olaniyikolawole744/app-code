data "aws_vpc" "server_vpc" {
   filter {
    name   = "tag:Name"
    values = ["dir_app_vpc_2"]
  }
}

data "aws_route_tables" "rts" {
 filter {
    name   = "vpc-id"
    values = [data.aws_vpc.server_vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["public_route_table"]
  }
}

data "aws_subnet" "selected" {
  count = length(var.subnet_marker_values)
  filter {
      name = "vpc-id"
      values = [data.aws_vpc.server_vpc.id]
     }

  filter {
    name   = "tag:Name"
    values = ["public_subnet_${var.subnet_marker_values[count.index]}"]
  }
}
