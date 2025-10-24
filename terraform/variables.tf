variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "az" {
  default = "us-east-1a"
}
variable "instance_type" {
  default = "t2.micro"
}

variable "db_name" {
  default = "mydb"
}
variable "instance_count" {
  description = "Number of EC2 instances "
  type        = number
  default     = 2
}
variable "password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}


