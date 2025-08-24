resource "azurerm_resource_group" "rg" {
  name     = lower("rg-${var.nameresourcegroup}-${random_id.name.hex}")
  location = var.location1
}

resource "azurerm_resource_group" "rg2" {
  name     = lower("rg-${var.nameresourcegroup2}-${random_id.name.hex}")
  location = var.location2
}
