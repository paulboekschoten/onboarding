variable "bucket_name" {
  type = string
  description = "Name of the s3 bucket. Must be unique."
}

variable "tags" {
  type = map(string)
  default = {}
  description = "Tags to set on the bucket."
}