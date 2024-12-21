locals {
  instance_type = var.environment == "prod" ? "t2.small" : "t3.micro"
}

#The "count" object can only be used in "module", "resource", and "data" blocks, and only when the "count" argument is set.
 