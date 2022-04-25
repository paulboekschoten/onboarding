# Output variable definitions

output "vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets
}

output "ec2_instance_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = module.ec2_instances.public_ip
}

output "website_bucket_arn" {
  value = module.website_s3_bucket.arn
  description = "ARN of the bucket."
}

output "website_bucket_name" {
  value = module.website_s3_bucket.name
  description = "Name (id) of the bucket."
}

output "website_bucket_domain" {
  value = module.website_s3_bucket.domain
  description = "Domain name of the bucket."
}

output "bucket_url" {
  value = "https://paul-example-2022-04-25.s3-eu-west-3.amazonaws.com/index.html"
  description = "Url of the bucket, different from exercise because other region."
}