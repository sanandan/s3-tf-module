{
  "Id": "TFDefaultPolicy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowSSLRequestsOnly",
      "Action": "s3:*",
      "Effect": "Deny",
      "Resource": [
        "arn:aws:s3:::${bucket_name}",
        "arn:aws:s3:::${bucket_name}/*"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      },
      "Principal": "*"
    },
    {
      "Sid": "IPAllow",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
	       "arn:aws:s3:::${bucket_name}",
         "arn:aws:s3:::${bucket_name}/*"
      ],
      "Condition": {
	 "NotIpAddress": {"aws:SourceIp": "192.168.1.1/32"}
      }
    }
  ]
}