remote_state {
    backend = "azurerm"
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "tfstate"
        storage_account_name = "tfstatepcen1"
        container_name = "tfstate"
    }
}
