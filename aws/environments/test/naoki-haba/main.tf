terraform {
  # バージョン指定
  required_version = "= 1.0.11"

  backend "s3" {
    bucket  = "tfstate-handson-484711902108"
    region  = "ap-northeast-1"
    # terraform.tfstateの保存先を指定
    key     = "naoki-haba/terraform.tfstate"
    # WS CLI で使用するプロファイルを指定
    profile = "hanson-terraform-deployer"
  }
}

# terraform.tfvarsの内容を変数として定義
variable aws_region {}
variable aws_profile {}
variable ENV_VALUE_ENVIRONMENT {}
variable TAG_PROJECT {}
variable TAG_ROLE {}
variable TAG_AUTHOR {}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  default_tags {
    tags = {
      Environment = var.ENV_VALUE_ENVIRONMENT
      Project     = var.TAG_PROJECT
      Role        = var.TAG_ROLE
      Author      = var.TAG_AUTHOR
    }
  }
}