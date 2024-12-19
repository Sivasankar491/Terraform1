variable "ami_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
}

variable "common_tags" {
  type = map
  default =  {
    Environment = "Prod"
  } 
}

variable "instance_names" {
    type = list
    default = ["frontend", "backend"]
  
}
