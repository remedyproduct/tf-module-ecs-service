resource "aws_alb_target_group" "main" {
  name        = format("%s-%s-%s", var.name, var.environment, "tg")
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path = var.health_check_path
  }
}
