## Create a new bucket

```sh
aws s3api create-bucket --bucket acl-bucket-sh78456 create-bucket-configuration="LocationConstraint=us-east-2" 
```

## Turn off Block Public Access for ACLs

```sh
aws s3api put-public-access-block \
--bucket acl-bucket-sh78456 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

```sh
aws s3api get-public-access-block --bucket acl-bucket-sh78456
```

## Change Bucket Ownership


```sh
aws s3api put-bucket-ownership-controls \
--bucket acl-bucket-sh78456 \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change ACLs to allow for a user in another AWS Account

```sh
aws s3api put-bucket-acl \
--bucket acl-bucket-sh78456 \
--access-control-policy file:///workspace/AWS-Examples/s3/acls/policy.json
```

## Access Bucket from other account

```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://acl-bucket-sh78456
aws s3 ls s3://acl-bucket-sh78456
```

## Cleanup

```sh
aws s3 rm s3://acl-bucket-sh78456/bootcamp.txt
aws s3 rb s3://acl-bucket-sh78456
```