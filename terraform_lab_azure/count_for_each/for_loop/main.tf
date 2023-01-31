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

resource "azurerm_resource_group" "rg" {
  count = 2  
  name     = "rg00-${count.index}"
  location = "westus2"
}

output "Resource-Group" {
value = {
  for rg in azurerm_resource_group.rg:
    rg.name => rg.location
 }
}
