variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"  
}

variable "ingress_rules" {
    type = list(map)
    default = [
        ingress {
            description = "SSH from anywhwere"
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        
        ingress {
            description = "http from anywhere"
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

    ]
  
}