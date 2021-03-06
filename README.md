# Usage

<!--- BEGIN_TF_DOCS --->
ECS Service - Terraform Module

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_alb_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) |
| [aws_ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) |
| [aws_ecs_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) |
| [aws_lb_listener_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) |
| [aws_route53_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alb\_dns\_name | ALB DNS Name | `string` | n/a | yes |
| alb\_listener | ALB Listener Service rule should be applied for | `string` | n/a | yes |
| alb\_security\_group\_id | Attached ALB Security Group ID to allow inbound traffic from | `string` | n/a | yes |
| alb\_zone\_id | ALB domain Zone ID | `string` | n/a | yes |
| cluster\_id | Cluster ID service should be attached to | `string` | n/a | yes |
| container\_definitions | JSON encoded list of container definitions | `string` | `"[]"` | no |
| desired\_count | Number of Fargate services to run | `number` | `1` | no |
| domain | Primary application domain | `string` | n/a | yes |
| environment | Environment (development, qa, live, etc.) | `string` | `"development"` | no |
| execution\_role\_arn | IAM Role ARN to run tasks by | `string` | n/a | yes |
| health\_check\_path | URL path for ALB to check the service is up & running | `string` | `"/"` | no |
| hosted\_zone\_id | Hosted Zone the service should be attached to (may be null) | `string` | n/a | yes |
| name | Service Name | `string` | n/a | yes |
| record\_name | Subdomain the service should be available by (leave empty to use the main domain) | `string` | n/a | yes |
| service\_port | Docker Image port to route traffic to | `number` | `80` | no |
| subnets | Subnet IDs to run tasks in | `list(string)` | n/a | yes |
| task\_definition\_cpu | Number of cpu units used by the task | `string` | `"256"` | no |
| task\_definition\_memory | Amount (in MiB) of memory used by the task | `string` | `"512"` | no |
| vpc\_id | VPC ID Service should be launched in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws\_security\_group\_id | n/a |

<!--- END_TF_DOCS --->

