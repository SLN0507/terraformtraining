terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_windows_virtual_machine" "vm" {

  resource_group_name = "myTFResourceGroup1"

  name = "vm-demo"

  location = "centralus"

  size = "Standard_F2"

  admin_username = "adminuser"

  admin_password = "P@$$w0rd1234!"

  network_interface_ids = "926e4b85-efb8-4c1a-9cca-37a31080b288"
  os_disk {

    caching = "ReadWrite"

    storage_account_type = "Standard_LRS"

  }



  # all other relevant attributes



  depends_on = [

    azurerm_storage_account.st

  ]

}



resource "azurerm_storage_account" "st" {

  resource_group_name = "myTFResourceGroup1"

  name = "stdemo"

  location = "centralus"

  account_tier = "Standard"

  account_replication_type = "LRS"

  # all other relevant attributes

}
