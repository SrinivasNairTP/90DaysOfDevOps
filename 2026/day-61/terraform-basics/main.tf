terraform {
  required_providers {
    aws = {

        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
}
  
  provider "aws" {
    region = "us-east-1"
  }
  
  resource "aws_s3_bucket" "s3_bucket_31_03_2026" {

    bucket = "my-terraform-bucket-31-03-2026"
    
  }

  resource "aws_instance" "my_instance" {

    ami = "ami-0c3389a4fa5bddaad"
    instance_type = "t3.micro"
    tags = {
      Name = "TerraWeek-Modified"
    }

  }