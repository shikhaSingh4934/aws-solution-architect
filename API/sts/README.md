```txt
AWS AssumeRole Flow – Explanation

1. A new IAM user was created. This user initially had no permissions.

2. AWS CLI credentials were configured using this user under a new profile called "sts". At this point, testing showed the user had no access to any AWS resources, including S3.

3. A CloudFormation template was written to create:
   - A new S3 bucket.
   - An IAM role that:
     - Trusted the new user to assume it (via a trust policy).
     - Had full access to the created S3 bucket (via a permissions policy).

4. The CloudFormation template was deployed to create the role and the bucket.

5. A separate inline policy was written and attached to the user. This policy granted the user permission to call "sts:AssumeRole" on the newly created role.

6. The user then assumed the role and received temporary credentials associated with that role. These credentials were configured under a new AWS CLI profile called "assumed".

7. Using the "assumed" profile, the user was able to successfully list the S3 bucket — demonstrating that the user gained access to S3 **only through assuming the role** and not directly.

This setup follows AWS best practices for secure, temporary, role-based access.
```

## Create user with no permissions
We need to create a new user with no permissions and generate out access keys
"https://docs.aws.amazon.com/cli/latest/reference/iam/create-user.html#examples"

```sh
aws iam create-user --user-name sts-test-user
aws iam create-access-key --user-name sts-test-user --output table
``` 
Copy the access key and secret here
```sh
aws configure
```
Then edit credentials file to change away from default profile
```sh
open ~/.aws/credentials 
```
Test who you are:
```sh
aws sts get-caller-identity
aws sts get-caller-identity --profile sts
```
Make sure you don't have access to S3
```sh
aws s3 ls --profile sts
```

## Create a Role
We are creating role for us to assume and creating resources we'll have access to using cloudformatin (template.yaml)
```sh
chmod u+x bin/deploy
./bin/deploy
# here role gives permission that user can assume that role.
```

## Use new user crednetials and assume role
```sh 
#inline policy for user that user have acces not to assume role from user's Admin
aws iam put-user-policy \
--user-name sts-test-user  \
--policy-name StsAssumePolicy \
--policy-document file://policy.json
```
```sh
#this will give you credentials for assumed role add this usng "aws configure"
aws sts assume-role \
--role-arn arn:aws:iam::969234563215:role/my-sts-example-stack-StsRole-Lc8rBQ0i0qJz \
--role-session-name s3-sts-eg \
--profile sts
```
My assumed role profile is "assumed"
```sh
aws sts get-caller-identity --profile assumed
```
```sh
#So for this profile you will have permission to list
aws s3 ls --profile assumed
```
```sh
#which you didn;t had for this profile which we made with no permisioon 
aws s3 ls --profile sts
```

### Cleanup
```sh
aws iam delete-user-policy --user-name sts-test-user --policy-name StsAssumePolicy
aws iam delete-access-key --access-key-id AKIA6DKXBYCH74DQCBG4 --user-name sts-test-user
aws iam delete-user --user-name sts-test-user
```
