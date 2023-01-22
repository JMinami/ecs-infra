terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }

  backend "s3" {
    region                  = "ap-northeast-1"
    bucket                  = "mydev-ecs-infra-tfstate"
    key                     = "mydev"
    profile                 = "mydev"
    shared_credentials_file = "~/.aws/credentials"
  }

  required_version = "= 1.3.5"
}

provider "aws" {
  profile                  = "mydev"
  region                   = "ap-northeast-1"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}

module "singleton" {
  source = "../../modules/singleton"
}