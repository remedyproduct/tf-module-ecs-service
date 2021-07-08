resource "aws_security_group" "ecs_tasks" {
  name        = format("%s-%s-%s", var.name, var.environment, "ecs-tasks")
  description = "Allow inbound access from the ALB only"
  vpc_id      = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 0
    to_port         = var.service_port
    security_groups = [var.alb_security_group_id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
