locals {
  bucket_name   = "demotestshiva43"
  custom_policy = templatefile("${path.module}/policy/custom-bucket-policy.tpl", { bucket_name = local.bucket_name })
}

module "s3bucket" {
  source               = "../../"
  bucket_name          = local.bucket_name
  bucket_region        = "us-east-1"
  custom_bucket_policy = local.custom_policy
}
