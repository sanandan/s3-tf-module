# s3-tf-module
creates s3 bucket with kms key as default sse.
```
bucket_name = <bucket name>
bucket_region = <bucket region>
```
if kms keys arn is not provided then a new kms key will created and used.
```
sse_kms_key_arn = <arn:aws:kms:::>
```

add s3 bucket policy --  module  default policy is set to reject  non secure access. To overwrite default  policy create template under policy directory of the root module initiliazing this.
example provided under example folder

```
custom_policy = templatefile("${path.module}/policy/custom-bucket-policy.tpl", { bucket_name = <bucket_name> }
```

To set life cycle rules:
```
    days_to_ia_class = 30
    days_to_glacier_class = 60

```
     > 30 to IA (As minimum of 30 days is requred for transistion to IA)
     > 60 to Glacier ( Minimum of 30 days more than IA)
