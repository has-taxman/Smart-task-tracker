output "https_certificate_arn" {
  value = aws_acm_certificate.cert.arn
}

output "https_listener_arn" {
  value = aws_lb_listener.https.arn
}

# output "route53_record_name" {
#   value = aws_route53_record.root.name
# }

output "https_status" {
  value = "HTTPS with domain ${var.domain_name} is set up via ACM + Route 53"
}