resource "aws_route53_record" "main" {
  zone_id = var.hosted_zone.id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
  }
}
