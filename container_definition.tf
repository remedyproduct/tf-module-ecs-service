data "aws_region" "current" {}

module "container_definition" {
  source = "github.com/cloudposse/terraform-aws-ecs-container-definition?ref=0.24.0"

  container_name   = var.name
  container_image  = format("%s:%s", var.image, var.version)
  container_cpu    = 256
  container_memory = 512

  log_configuration = {
    logDriver = "awslogs"
    options = {
      awslogs-create-group  = true,
      awslogs-region        = aws_region.current.name
      awslogs-group         = format("%s-logs", var.environment)
      awslogs-stream-prefix = var.name
    }
    secretOptions = []
  }

  environment = var.environment

  port_mappings = [
    {
      containerPort = var.service_port
      hostPort      = 80
      protocol      = "tcp"
    }
  ]
}
