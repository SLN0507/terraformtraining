terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}
variable "RG_names" {
  description = "Create resource Group with these names"
  type        = list(string)
  default     = ["rg1", "rg3", "rg4"]
}


resource "azurerm_resource_group" "rg" {

  count = 3  
  name     = var.RG_names[count.index]
  location = "westus2"
}
