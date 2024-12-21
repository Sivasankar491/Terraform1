variable "instance_names" {
    type = list
    default = ["mysql",  "backend", "frontend"]
}

variable "environment" {
    type = string
    default = "prod"
  
}

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        terraform = "True"
    }
}