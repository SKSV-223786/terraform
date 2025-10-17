
resource "aws_route53_record" "roboshop" {
  count = 2
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  allow_overwrite = true
  records = [aws_instance.Frontend[count.index].private_ip]
}