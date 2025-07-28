### template code 
https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/EncryptionV2.html
### create a bucket
aws s3 mb s3://client-side-encryption-example-5467

### Run our our SDK ruby script
bundle exec ruby encrypt.rb

### Cleanup

aws s3 rm s3://client-side-encryption-example-5467 aws s3 rb s3://client-side-encryption-example-5467