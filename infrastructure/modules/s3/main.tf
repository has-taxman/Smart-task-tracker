# modules/s3/main.tf

resource "aws_s3_bucket" "frontend" {
  bucket = var.bucket_name

  tags = {
    Name = "smarttask-frontend"
  }
}

resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_policy" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:GetObject"],
        Resource  = ["${aws_s3_bucket.frontend.arn}/*"]
      }
    ]
  })
  depends_on = [aws_s3_bucket_public_access_block.frontend]
}

resource "aws_s3_object" "html_files" {
  for_each = {
    "index.html"     = "${path.module}/../../../backend/public/index.html"
    "login.html"     = "${path.module}/../../../backend/public/login.html"
    "register.html"  = "${path.module}/../../../backend/public/register.html"
    "dashboard.html" = "${path.module}/../../../backend/public/dashboard.html"
  }

  bucket       = aws_s3_bucket.frontend.bucket
  key          = each.key
  source       = each.value
  content_type = "text/html"
  
}
 
resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}
