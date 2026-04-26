terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.81.0, < 6.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {

  config_path = "~/.kube/config"


}

