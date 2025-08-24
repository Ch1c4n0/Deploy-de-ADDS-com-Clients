terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3dea800c-d3a9-4970-8b2e-2df0a1a901d1"
  client_id       = "a611525a-2632-40a8-9c2b-6c537d0db36e"
  client_secret   = var.client_secret
  tenant_id       = "b9e8705c-b94f-4b51-aa9f-bbcc4fbc6f67"
}

#variable "subscription_id" {}
#variable "client_id" {}
variable "client_secret" {
  description = "Azure Service Principal Client Secret"
  sensitive   = true
}
#variable "tenant_id" {}

# Opcional: backend para o storage account
# backend "azurerm" {
#   resource_group_name  = "<nome do RG>"
#   storage_account_name = "<nome do storage>"
#   container_name       = "<nome do container>"
#   key                  = "terraform.tfstate"
# }
