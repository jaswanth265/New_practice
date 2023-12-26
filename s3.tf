terraform {
  backend  "s3" {
    bucket = "bucket-terraform-practice"
    key = "practice/terraform.tf"
    region = "us-east-1"
  }

}