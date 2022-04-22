# terraform_ebs_volume

Terraform module to create lambda function

## Dependencies

IAM Role  <https://github.com/virsas/terraform_iam_role>

You also need a zipped function.

In case you go with golang, create a main.go, build it and then zip main to name.zip file located in your ./lambdas directory

## Terraform example

``` terraform
##################
# Lambda variables
##################
variable "lambdaS3Move" { 
  default = { 
    name = "lambdaS3Move"
    architecture = "x86_64"
    runtime = "go1.x"
    handler = "main"
    # if true each release is a new version of the lambda function
    # to access the lambda then you need the qualified_arn output
    publish = false
    # from 128 MB to 10,240 MB, in 1-MB increments
    memory = 128
    # timeout for the script to run up to 900 seconds 
    timeout = 3
  } 
}

##################
# Lambda module
##################
module "lambdaS3Move" {
  source       = "github.com/virsas/terraform_lambda_function"
  instance     = var.lambdaS3Move
  role         = modeul.S3MoveLambdaRole.arn
}
```
