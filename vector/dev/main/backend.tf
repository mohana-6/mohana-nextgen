terraform {
  backend "s3" {
    bucket  =  "us-east-dev-us-gdap-jen-tfstate"
    key     =  "errorbudget-terraform-tfstate/vector-main.tfstate"
    region  =  "us-east-1"
    encrypt = true
    acl     = "private"
  }
}