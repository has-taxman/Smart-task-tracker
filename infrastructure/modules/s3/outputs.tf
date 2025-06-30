output "bucket_website_endpoint" {
  value = aws_s3_bucket_website_configuration.frontend.website_endpoint
}

output "bucket_website_zone_id" {
  value = aws_s3_bucket_website_configuration.frontend.website_domain
}