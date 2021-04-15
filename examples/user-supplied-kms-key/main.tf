module "s3bucket" {
    source = "../../"
    bucket_name = "demotestshiva44"
    bucket_region = "us-east-1"
    sse_kms_key_arn = "arn:aws:kms:us-east-1:XXXX:key/XXX"
}