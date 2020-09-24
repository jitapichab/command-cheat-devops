### override certificate  ELB ###
```
aws elbv2 modify-listener --listener-arn  --certificates CertificateArn=
```
### Create bucket with versioning and default encription###
```console
aws s3api create-bucket --bucket elretake-kops --region us-east-1
aws s3api put-bucket-versioning --bucket elretake-kops  --versioning-configuration Status=Enabled
aws s3api put-bucket-encryption --bucket prefix-example-com-state-store --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'
```



