variable "name" {
  type        = string
  description = "Service Name"
}

variable "environment" {
  type        = string
  description = "Environment (development, qa, live, etc.)"
  default     = "development"
}

variable "subnets" {
  type        = map(string)
  description = "Subnet IDs to run tasks in"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID Service should be launched in"
}

variable "alb_security_group_id" {
  type        = string
  description = "Attached ALB Security Group ID to allow inbound traffic from"
}

variable "alb_listener" {
  type        = string
  description = "ALB Listener Service rule should be applied for"
}

variable "alb_zone_id" {
  type        = string
  description = "ALB domain Zone ID"
}

variable "alb_dns_name" {
  type        = string
  description = "ALB DNS Name"
}

variable "health_check_path" {
  type        = string
  description = "URL path for ALB to check the service is up & running"
  default     = "/"
}

variable "hosted_zone_id" {
  type        = string
  description = "Hosted Zone the service should be attached to (may be null)"
}

variable "record_name" {
  type        = string
  description = "Subdomain the service should be available by (leave empty to use the main domain)"
}

variable "domain" {
  type        = string
  description = "Primary application domain"
}

variable "image" {
  type        = string
  description = "Docker Image to deploy"
}

variable "image_version" {
  type        = string
  description = "Docker Image version to deploy"
  default     = "latest"
}

variable "service_port" {
  type        = number
  description = "Docker Image port to route traffic to"
  default     = 80
}

variable "desired_count" {
  type        = number
  description = "Number of Fargate services to run"
  default     = 1
}

variable "execution_role_arn" {
  type        = string
  description = "IAM Role ARN to run tasks by"
}
