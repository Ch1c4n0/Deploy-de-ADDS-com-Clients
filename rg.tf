resource "azurerm_resource_group" "rg" {
  name     = lower("rg-${var.nameresourcegroup}")
  location = var.location1
}

resource "azurerm_resource_group" "rg2" {
  name     = lower("rg-${var.nameresourcegroup2}")
  location = var.location2
}