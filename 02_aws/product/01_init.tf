terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_key_pair" "lch_key"{
  key_name = "lch-key"
  public_key = file("./.ssh/lch.pub")
}