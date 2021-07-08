resource "aws_alb_target_group" "main" {
  name        = substr(format("%s-%s-%s", var.name, var.environment, "tg"), 0, 32)
  port        = var.service_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path = var.health_check_path
  }
}
