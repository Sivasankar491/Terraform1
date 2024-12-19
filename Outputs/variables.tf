variable "ami" {
    type = string
    default = "ami-09c813fb71547fc4f" 
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}


variable "common_tags" {
    type = map
    default = {
        Environment = "UAT"
        terraform = "True"
        Project = "Expense"
    }
  
}