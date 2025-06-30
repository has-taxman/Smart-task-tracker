variable "bucket_name" {
  description = "Name of the S3 bucket to host frontend"
  type        = string
}

variable "domain_name" {
  description = "Root domain name (e.g., hasnatur-devops.com)"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ACM Certificate ARN used for HTTPS"
  type        = string
}
