provider "aws" {
  region = var.region
}

resource "aws_lambda_function" "function" {
  function_name     = var.instance.name

  role              = var.role

  architectures     = [ var.instance.architecture ]
  runtime           = var.instance.runtime
  handler           = var.instance.handler

  memory_size       = var.instance.memory
  timeout           = var.instance.timeout

  filename          = "./lambdas/${var.instance.name}.zip"
  source_code_hash  = filebase64sha256("./lambdas/${var.instance.name}.zip")

  publish           = var.instance.publish
}