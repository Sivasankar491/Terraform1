resource "aws_instance" "expense" { 
  count = length(var.instance_names)  
  ami           = data.aws_ami.expense.id
  instance_type = local.instance_type
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]

  tags = merge(
    var.common_tags,
    {
        Name = var.instance_names[count.index]
    }
  ) 
}

resource "aws_security_group" "allow_ssh" {
  name        = "Allow_SSH"
  description = "Allow SSH inbound traffic"
  
  ingress {
    description = "SSH from everywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
        Name = "Allow-SSH"
    }
  ) 
}