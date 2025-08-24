resource "azurerm_virtual_network_peering" "peer-vnet1" {
  name                      = "peer-${var.vnet1-name}to${var.vnet2-name}-${random_id.name.hex}"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id
}

resource "azurerm_virtual_network_peering" "peer-vnet2" {
  name                      = "peer-${var.vnet2-name}to${var.vnet1-name}-${random_id.name.hex}"
  resource_group_name       = azurerm_resource_group.rg2.name
  virtual_network_name      = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet1.id
}
