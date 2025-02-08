provider "aws" {
  region = "us-east-1"
}


resource "instance_type" "name" {
  instance_type = var.instance_type
}