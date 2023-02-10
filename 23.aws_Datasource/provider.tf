provider "aws" {
  region     = "eu-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

variable "access_key" {
  type = string

}

variable "secret_key" {
  type = string

}

variable "image_name" {
  type = list(any)

}

variable "instance_type" {
  type = string

}


data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  # name = 
  # root device type = ebs
  # Virtualization type = hvm

  filter {
    name   = "name"
    values = var.image_name
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  #key_name               = aws_key_pair.key-tf.key_name
  #vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-tf-instance"
  }

}


output "ami_id" {
  value = data.aws_ami.ubuntu.id

}