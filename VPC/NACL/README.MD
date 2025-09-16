# createing NACLs
```sh
aws ec2 create-network-acl \
  --vpc-id vpc-0ad3b587d18a81865
```
# add entry
```sh
aws ec2 create-network-acl-entry \
--network-acl-id acl-052dee16b45b14f3d \
--ingress \
--rule-number 90 \
--protocol -1 \
--port-range From=0,To=65535 \
--cidr-block 128.230.143.64/32 \
--rule-action deny
```

```
# Get AMI for Amazon Linux 2
```sh
aws ec2 describe-images \
--owners amazon \
--filters "Name=name Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
--query "Images[?starts_with(Name, 'amzn2')]|sort_by(@, &CreationDate)[-1].ImageId" \
--region us-east-2 \
--output text

```