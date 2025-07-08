terraform {
  backend "s3" {
    bucket  =  "mohana6-bucket"
    key     =  "errorbudget-terraform-tfstate/vector-mosot.tfstate"
    region  =  "us-east-1"
    encrypt = true
    acl     = "private"
  }
}