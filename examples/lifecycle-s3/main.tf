module "s3bucket" {
    source = "../../"
    bucket_name = "demotestshiva42"
    bucket_region = "us-east-1"
    days_to_ia_class = 30
    days_to_glacier_class = 30
}