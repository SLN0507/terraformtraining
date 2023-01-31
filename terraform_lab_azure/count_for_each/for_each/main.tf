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
  default     = ["rg1", "rg4", "rg3"]
}


resource "azurerm_resource_group" "rg" {

#  count = 2  
  for_each = toset(var.RG_names)
  name     = each.value
  location = "westus2"
}
