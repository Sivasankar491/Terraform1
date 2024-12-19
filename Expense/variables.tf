variable "instance_names" {
    type = list
    default = ["mysql",  "backend", "frontend"]
}

variable "common_tags" {
    type = map
    default = {
        Environment = "UAT"
        Project = "Expense"
        terraform = "True"
    }
}