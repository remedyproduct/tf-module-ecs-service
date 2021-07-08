data "aws_region" "current" {}

module "container_definition" {
  source = "github.com/cloudposse/terraform-aws-ecs-container-definition?ref=0.57.0"

  container_name  = var.name
  container_image = format("%s:%s", var.image, var.image_version)

  log_configuration = {
    logDriver = "awslogs"
    options = {
      awslogs-create-group  = true,
      awslogs-region        = data.aws_region.current.name
      awslogs-group         = format("%s-logs", var.environment)
      awslogs-stream-prefix = var.name
    }
    secretOptions = []
  }

  environment = var.env_vars

  port_mappings = [
    {
      containerPort = var.service_port
      hostPort      = var.service_port
      protocol      = "tcp"
    }
  ]
}
