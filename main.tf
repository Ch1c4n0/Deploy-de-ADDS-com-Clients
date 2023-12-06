terraform {
  backend "azurerm" {
    resource_group_name  = "Nome do RG"
    storage_account_name = "Nome do Storage Account"
    container_name       = "Nome do Container"
    key                  = "Chave"
  }
}



provider "azurerm" {
  # Configuration options
  features {

  }
}