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
  subscription_id = ""
  client_id       = ""
  client_secret   = var.client_secret
  tenant_id       = ""
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