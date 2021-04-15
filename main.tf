
resource "aws_kms_key" "newkey" {
  count                   = var.sse_kms_key_arn != "" ? 0 : 1
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

locals {
  kms_key_arn = var.sse_kms_key_arn != "" ? var.sse_kms_key_arn : aws_kms_key.newkey[0].arn
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = var.bucket_acl

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = local.kms_key_arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true

    transition {
      days          = var.days_to_ia_class
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.days_to_glacier_class
      storage_class = "GLACIER"
    }
  }

}

locals {
  template_vars = {
    bucket_name = aws_s3_bucket.bucket.id
  }
  policy = templatefile("${path.module}/templates/default-bucket-policy.tpl", local.template_vars)
}

resource "aws_s3_bucket_policy" "policy_basic" {
  bucket = aws_s3_bucket.bucket.id
  policy = var.custom_bucket_policy != "" ? var.custom_bucket_policy : local.policy
}
