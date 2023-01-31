# command terraform apply --auto-approve -var="env=prod" 
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

variable "env" {
  default = "prod"
  type = string
}

resource "azurerm_resource_group" "rg" {
  count = "${var.env == "dev" ? 1 : 0}"
#if count is 0 means it will not create a resource. If env -eq dev means count 1, or else 0 which will deploy resource accordingly
  name = "${var.env}-RG"
  location = "West US"
}
