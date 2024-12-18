terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  profile = "BZ-learner"
}

provider "aws" {
  alias = "east"
  profile = "BZ-learner"
  region = "us-east-2"
}
