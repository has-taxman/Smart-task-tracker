variable "domain_name" {
  description = "Your domain name (e.g., smarttasktracker.com)"
  type        = string
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

variable "zone_id" {
  description = "Route53 zone ID"
  type        = string
}