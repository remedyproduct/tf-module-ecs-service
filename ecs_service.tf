resource "aws_ecs_service" "main" {
  name            = var.name
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.desired_count

  launch_type = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.ecs_tasks.id]
    subnets         = var.subnets
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.main.id
    container_name   = var.name
    container_port   = var.service_port
  }
}
