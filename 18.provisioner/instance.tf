# creating keypair
#generate keypair in linux
#type ssh-keypair -t rsa
# give path like ./id_rsa
# connect to linux
# type command ssh -i id_rsa username@ip
# ssh -i path (id_rsa) root@3.86.89.65


# Creating security group with dynamic blocks





# creating instance

resource "aws_instance" "web" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-tf-instance"
  }

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("${path.module}/id_rsa.pub")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "readme.md"      # terraform machine local
    destination = "/tmp/readme.md" # remote machine


  }

  provisioner "file" {
    content     = "This is my content" # terraform machine local
    destination = "/tmp/content.md"    # remote machine


  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > /tmp/mypublicip.txt" # echo print public_ip x.x.x.x -> x.x.x.x >/tmp/mypublicip.txt


  }
  provisioner "local-exec" {
    working_dir = "/tmp"
    command     = "echo ${self.public_ip} > mypublicip.txt" # echo print public_ip x.x.x.x -> x.x.x.x >/tmp/mypublicip.txt
  }

  provisioner "local-exec" {
    interpreter = [            # it is use to execute your file by terraform script
      "/usr/bin/python3", "-c" #it is your path that where is you file keep and execute
    ]
    command = "print('HelloWorld')"
  }

  provisioner "local-exec" {
    on_failure = continue #this string help you that your execution will countinue after failure
    command    = "env>env.txt"
    environment = {
      envname = "envvalue"
    }

  }

  provisioner "local-exec" {
    when    = create
    command = "echo 'at create'" # we can use this message as create machine

  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'at delete'" # we can use this message as destroy 

  }

  provisioner "remote-exec" {
    inline = [
      "ifconfig > /tmp/ifconfig.output",
      "echo 'hello vishesh'>/tmp/test.txt"
    ]

  }

  provisioner "remote-exec" {
    script = "./testscript.sh"

  }


}


