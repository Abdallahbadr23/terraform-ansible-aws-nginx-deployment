terraform {
  backend "s3" {
    bucket = "lab3-terraform01"
    key    = "web-project1"
    region = "us-east-1"
  }
}