output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.frontend.domain_name
}

# output "route53_record_fqdn" {
#   value = aws_route53_record.www.fqdn
# }
