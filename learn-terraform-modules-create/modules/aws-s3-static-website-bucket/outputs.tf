output "arn" {
  value = aws_s3_bucket.s3_bucket.arn
  description = "ARN of the bucket."
}

output "name" {
  value = aws_s3_bucket.s3_bucket.id
  description = "Name (id) of the bucket."
}

output "domain" {
  value = aws_s3_bucket_website_configuration.s3_bucket.website_domain
  description = "Domain name of the bucket."
}