variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "az" {}
variable "vpc_name" {
  default = "project1-vpc"
}
