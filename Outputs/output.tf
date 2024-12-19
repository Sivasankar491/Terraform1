output "ec2_info" {
    value = aws_instance.test 
}

output "sg_info" {
    value = aws_security_group.allow_ssh
}