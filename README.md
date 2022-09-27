
# Intro

environments can be:
- stg
- prod

```
terraform workspace list
terraform workspace select {dev,stg,prod}
```

Execute it with:

```
terraform plan
terraform apply
```

Basic Configuration for Terraform:

1. Install AWS cli in your local. It will create a `.aws` folder in the home directory. And after that update `credentials` file in that `.aws` directory. Can be accessed like below
```
vi ~/.aws/credentials
 ```  

2. Add AWS access and secret key in the credentials along with profile name. Profile name need to be simillar to `terraform workspace list` name. Example is like below
```
[stg]
aws_access_key_id = AxxxxxxxXXXXXXXxxxxxxxUR
aws_secret_access_key = WzXxxxxxxxxXXXXXXXXXXXXxxxxxxxxOC

[prod]
aws_access_key_id = AxxxxxxXXXXXXXXXXxxxxxxxxxxS
aws_secret_access_key = zxxxxxxxxxXXXXXXXXXxxxxxxxxxxM
```

3. Update `~/.aws/config` like below 
```
[profile stg]
region = eu-central-1
[profile prod]
region = eu-central-1
```

4. Manually create S3 bucket where all the terraform state will be stored. In our case S3 bucket named as `rxd-terraform-state`(check `provider.tf`)

5. Update AMI ID required for EC2 instance
6. Update the SSM value as per requirement from the AWS console
7. Configure `Git` As CI/CD for terraform done using Github actions

- Go to the repo and in `settings` --> `Environments` --> `New Environment`
- Create `stg` --> `Environment secrets` --> `Add Secret` add AWS access key and Secret key for Staging Account
- Create `prod` --> `Environment secrets` --> `Add Secret` add AWS access key and Secret key for Staging Account
- Also for `prod` add `Required reviewers`add the reviewer (In case of organisation its possible to add group) and in the deployment branches add rulle that only branch name start with some jira ticket ID can be deployed like `NEW-*`

