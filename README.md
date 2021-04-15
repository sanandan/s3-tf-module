# s3-tf-module
creates s3 bucket with kms key as default sse.

provided kms key arn is used , else creates a new kms key for sse
create with default kms

add s3 bucket policy -- default policy to reject non secure access.

can provide custom policy to use instead

This module creates kms to sse encryption if needed

default life cycle rules
     > 30 to IA (As minimum of 30 days is requred for transistion to IA)
     > 60 to Glacier ( Minimum of 30 days more than IA)
