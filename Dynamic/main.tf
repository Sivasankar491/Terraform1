resource "aws_instance" "test" { 
  ami           = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]

  tags = merge(
    {
        Name = "Test"
    }
  ) 
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