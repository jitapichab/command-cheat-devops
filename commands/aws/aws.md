### override certificate  ELB ###
```
aws elbv2 modify-listener --listener-arn  --certificates CertificateArn=
```
### Create bucket with versioning and default encription###
```console
foo@bar:~$ aws s3api create-bucket --bucket test --region us-east-1
foo@bar:~$ aws s3api put-bucket-versioning --bucket test --versioning-configuration Status=Enabled
foo@bar:~$ aws s3api put-bucket-encryption --bucket test --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'
```




