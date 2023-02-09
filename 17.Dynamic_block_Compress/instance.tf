# creating keypair
#generate keypair in linux
#type ssh-keypair -t rsa
# give path like ./id_rsa
# connect to linux
# type command ssh -i id_rsa username@ip
# ssh -i path (id_rsa) root@3.86.89.65

resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

# Creating security group with dynamic blocks

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  # inbound rules
  dynamic "ingress" {
    for_each = [22, 80, 443]
    iterator = port
    content {
      description      = "TLS from VPC"
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      

    }
  }

# outbound rules 
egress {
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}

}



# creating instance

resource "aws_instance" "web" {
  ami                    = "ami-084e8c05825742534"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-tf-instance"
  }
}