# --create a bucket
```sh
aws s3 mb s3://bucket-policy-test-bucket2845
```
# --create bucket policy
```sh
aws s3api put-bucket-policy --bucket bucket-policy-test-bucket2845 --policy file://bucket-policy.json
```
# -- action on other account
```sh
touch filefrommaya.txt
aws s3 cp filefrommaya.txt s3://bucket-policy-test-bucket2845
aws s3 ls s3://bucket-policy-test-bucket2845
```
# --clean up
```sh
aws s3 rm s3://bucket-policy-test-bucket2845/filefrommaya.txt
aws s3 rb s3://bucket-policy-test-bucket2845
```