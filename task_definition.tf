resource "aws_ecs_task_definition" "main" {
  family                = format("%s-%s", var.name, var.environment)
  container_definitions = nonsensitive(module.container_definition.json_map_encoded_list)

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  execution_role_arn = var.execution_role_arn
}
