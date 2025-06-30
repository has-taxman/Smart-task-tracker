variable "bucket_name" {
  description = "The name of the S3 bucket (must be a website-enabled bucket)"
  type        = string
}

variable "region" {
  description = "AWS region where the bucket is hosted"
  type        = string
}

variable "zone_id" {
  description = "Hosted zone ID to use when creating Route53 records"
  type        = string
}

variable "domain_name" {
  description = "The root domain name (e.g. hasnatur-devops.com)"
  type        = string
}

variable "subdomain" {
  description = "Full subdomain to configure (e.g. www.hasnatur-devops.com)"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ACM cert for CloudFront custom domain"
  type        = string
}
