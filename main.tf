terraform {
  backend "s3" {
    bucket         = "cgitbucketb1student1"
    key            = "DevOpsB1-remote-functions.tfstate"
    dynamodb_table = "DevOpsB1-terraform-state-lock-dynamo"
    encrypt        = true
    region         = "us-east-2"
  }
}
provider "aws" {
  region = var.aws_region
}
