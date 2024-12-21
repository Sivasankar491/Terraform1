resource "aws_instance" "test" { 
  ami           = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]

  tags = merge(
    {
        Name = "Test"
    }
  ) 

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > public_ip.out"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ip.out"
  }
  
  provisioner "remote-exec" {
    inline = [ 
		"sudo dnf install nginx -y",
		"sudo systemctl start nginx"
     ]
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
}



resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  
  dynamic ingress {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
        Name = "Test"
    }
  ) 
}