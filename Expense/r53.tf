resource "aws_route53_record" "expense" {
  # count = length(var.instance_names) 
  count = length(aws_instance.expense) 
  zone_id = data.aws_route53_zone.expense.zone_id
  name    = var.instance_names[count.index] == "frontend" ? var.zone_name : "${var.instance_names[count.index]}.${var.zone_name}"
  type    = "A"
  ttl     = 1
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}


