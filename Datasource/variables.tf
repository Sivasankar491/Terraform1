variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Environment = "Dev"
        terraform = "True"
    }
}