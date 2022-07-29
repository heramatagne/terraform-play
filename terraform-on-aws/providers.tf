#terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#setup AWS Provider
provider "aws" {
  region  = "us-west-2"
  profile = "tf-cli-west2"
}