variable "instance_type" {
    type = map
    default = {
        mysql = "t2.small"
        backend = "t3.micro"
        frontend = "t2.micro"
    }
}

variable "common_tags" {
    type = map
    default = {
        Environment = "Dev"
        Terraform = "True"
        Project = "Expense"
    }
}