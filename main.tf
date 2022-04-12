
terraform {
  required_providers {
#     ad = {
#       source  = "hashicorp/ad"
#       version = "0.4.3"
#     }
    aws = {
      source  = "hashicorp/aws"
      version = "3.47.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  count         = 1
  # tags = {
  #   Name = var.instance_names[count.index]
  # }
}
# variable "instance_names" {
#   type    = list(any)
#   default = ["dev-instance", "stage-instance", "prod-instance"]
# }

resource "null_resource" "delay" {
    provisioner "local-exec" {
    command = "sleep 1"
}
}
resource "null_resource" "delay1" {
    provisioner "local-exec" {
    command = "sleep 1"
}
}

