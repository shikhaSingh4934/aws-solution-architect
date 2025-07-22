# Create A BUCKET
```sh
aws s3 mb s3://corsexamplebucket-sh7868
```
# change block public access
```sh
aws s3api put-public-access-block \
--bucket corsexamplebucket-sh7868 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=False,RestrictPublicBuckets=False"
```
# Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket corsexamplebucket-sh7868 --policy file://bucket-policy.json
```
# Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket corsexamplebucket-sh7868 --website-configuration file://website.json
```
# Upload our index.html file and include a resource that would be cross-origin
```sh
aws s3 cp index.html s3://corsexamplebucket-sh7868
```
# Create API bucket then test end point
```sh
curl -X POST -H "Content-Type: application/json" https://jtltsne6r5.execute-api.us-east-2.amazonaws.com/prod/hello
```
# Set CORS on our bucket
```sh
aws s3api put-bucket-cors --bucket corsexamplebucket-sh7868 --cors-configuration file://cors.json

```