variable "days_to_ia_class" {
  type = number
  default = 30
  description = "Number of days after which data transitions to infrequntenly accessed storage class"
}

variable "days_to_glacier_class" {
  type = number
  default = 60
  description = "Number of days after which data transitions to glacier storage class"
}


variable "custom_bucket_policy" {
    type = string
    default = ""
}

variable "public_access" {
    type = bool
    default = false
}

variable "bucket_name" {
    type = string
    description = "Name of the bucket"
}

variable "bucket_region" {
    type = string
    description = "Region to create the bucket in"
}

variable "bucket_acl" {
  type = string
  default = "private"
}

# variable "attach_policy" {
#     type = bool
#     default = false
#     description = "Set to true if provding custom policy and bucket_policy value will be used as bucket policy"
# }

variable "sse_kms_key_arn" {
    type = string
    default = ""
    description = "KMS key arn to be used and SSE key"
}
