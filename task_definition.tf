resource "aws_ecs_task_definition" "main" {
  family                = format("%s-%s", var.name, var.environment)
  container_definitions = nonsensitive(var.container_definitions)

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.task_definition_cpu
  memory                   = var.task_definition_memory

  execution_role_arn = var.execution_role_arn
}
