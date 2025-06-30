variable "domain_name" {
  default = "hasnatur-devops.com"
}

variable "alb_arn" {
  description = "ARN of the ALB"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name of the ALB (for Route 53 alias record)"
  type        = string
}

variable "alb_zone_id" {
  description = "Hosted zone ID of the ALB (for Route 53 alias record)"
  type        = string
}

variable "target_group_arn" {
  description = "Target group ARN to forward HTTPS traffic to"
  type        = string
}
variable "bucket_name" {
  description = "S3 bucket for frontend"
  type        = string
  default = "smarttask-frontend-hasnat"
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS"
  type        = string
}
