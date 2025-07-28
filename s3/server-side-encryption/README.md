## Create a bucket
aws s3 mb s3://encryption-test-buscket-sh45

## Create a file and Put Object with encrpytion SS3-S3
echo "Hello World " > file.txt

## Put Object with encryption of SS3-KMS
aws s3api put-object \
--bucket encryption-test-buscket-sh45 \
--key file.txt \
--body file.txt \
--server-side-encryption "aws:kms" \
--ssekms-key-id "2b440f51-17cb-458b-8bb9-6994cca9358b"

## Put Object with SSE-C Using s3api
# Generate 256-bit base64-encoded key
export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
echo "Base64 Key: $BASE64_ENCODED_KEY"

# Calculate MD5 hash of the decoded key and base64-encode it
export MD5_VALUE=$(echo -n "$BASE64_ENCODED_KEY" | base64 --decode | openssl dgst -md5 -binary | base64)
echo "Base64 MD5: $MD5_VALUE"

# Upload with SSE-C using customer-provided key
aws s3api put-object \
  --bucket encryption-test-buscket-sh45 \
  --key file.txt \
  --body file.txt \
  --sse-customer-algorithm AES256 \
  --sse-customer-key "$BASE64_ENCODED_KEY" \
  --sse-customer-key-md5 "$MD5_VALUE"

## try to download file
aws s3api get-object \
  --bucket encryption-test-buscket-sh45 \
  --key file.txt \
  --sse-customer-algorithm AES256 \
  --sse-customer-key "$BASE64_ENCODED_KEY" \
  --sse-customer-key-md5 "$MD5_VALUE" \
  downloaded-file.txt

---
## Put Object with SSE-C Using s3

openssl rand -out ssec.key 32
# Upload with SSE-C using customer-provided key
aws s3 cp file.txt s3://encryption-fun-ab-135/file.txt
--sse-c AES256
--sse-c-key fileb://ssec.key

## try to download file
aws s3 cp s3://encryption-test-buscket-sh45/file.txt file.txt --sse-c AES256 --sse-c-key fileb://ssec.key

