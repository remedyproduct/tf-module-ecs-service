resource "aws_lb_listener_rule" "main" {
  listener_arn = var.alb_listener

  action {
    target_group_arn = aws_alb_target_group.main.id
    type             = "forward"
  }

  condition {
    host_header {
      values = [format("%s.%s", var.record_name, var.domain)]
    }
  }
}
