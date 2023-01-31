# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
}

#  required_version = ">= 0.14.9"

provider "azurerm" {
  features {}
}
data "azurerm_resources" "example" {
  resource_group_name = "terraform-RG"
}

# Get Resources with specific Tags
data "azurerm_resources" "tag" {
  resource_group_name = "terraform-RG"
  required_tags = {
    environment = "production"
#    role        = "webserver"
    location	= "eastus"
  }
}

output "id" {
  value = data.azurerm_resources.example.id
}
