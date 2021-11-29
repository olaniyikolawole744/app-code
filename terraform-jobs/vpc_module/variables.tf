
 variable "vpc_region" {
     default = "us-east-1"
 }
variable "vpc_cidr_block" {
    default = "50.0.0.0/16"
}
variable "vpc_name" {
    default = "dir_app_vpc_2"
}

variable "backend_key" {
    default = "dir-app/vpc/terraform.tfstate"
}

