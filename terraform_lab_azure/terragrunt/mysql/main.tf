provider "azurerm" {
  version = "=1.39.0"
}
terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "test" {
  name     = "mysql" 
  location = "westus"
  tags = {
    environment = "10 branch"
  }
}
