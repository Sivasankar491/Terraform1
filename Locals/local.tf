locals {
  instance_type = var.environment == "prod" ? "t2.small" : "t3.micro"
}