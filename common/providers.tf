terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.0"
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

provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  client_id       = var.AZ_client_id
  client_secret   = var.AZ_client_secret
  subscription_id = var.AZ_subscription_id
  tenant_id       = var.AZ_tenant_id
}

provider "azurerm" {
  alias = "east"
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}
