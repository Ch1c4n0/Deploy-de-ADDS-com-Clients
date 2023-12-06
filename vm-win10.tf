resource "azurerm_public_ip" "my-public-ip1" {
  name                = "Public-ip-${var.name-vm2}"
  resource_group_name = azurerm_resource_group.rg2.name
  location            = var.location2
  allocation_method   = "Dynamic"

  tags = {
    environment = "Testing"
  }

  depends_on = [
    azurerm_virtual_network_dns_servers.dns1,
    time_sleep.wait_120_seconds
  ]
}

resource "azurerm_network_interface" "mynetworkinterface1" {
  name                = "network-interface-${var.name-vm2}"
  location            = var.location2
  resource_group_name = azurerm_resource_group.rg2.name

  ip_configuration {
    name                          = "internal-${var.name-vm2}"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.my-public-ip1.id
  }

  depends_on = [
    azurerm_virtual_network_dns_servers.dns1,
    time_sleep.wait_120_seconds
  ]

}

# Windows 11 Virtual Machine
resource "azurerm_windows_virtual_machine" "myvirtualmachine1" {
  name                = "vm-${var.name-vm2}"
  resource_group_name = azurerm_resource_group.rg2.name
  location            = var.location2
  size                = var.my_virtual_machine_size
  admin_username      = var.win_username
  admin_password      = var.win_userpass
  network_interface_ids = [
    azurerm_network_interface.mynetworkinterface1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-10"
    sku       = "win10-22h2-pro"
    version   = "latest"
  }

  depends_on = [
    azurerm_virtual_network_dns_servers.dns1,
    time_sleep.wait_120_seconds
  ]
}


# Security Group - allowing RDP Connection
resource "azurerm_network_security_group" "sg-rdp-connection1" {
  name                = "allowrdpconnection-${var.name-vm2}"
  location            = var.location2
  resource_group_name = azurerm_resource_group.rg2.name

  security_rule {
    name                       = "rdpport"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Testing"
  }

    depends_on = [
    azurerm_virtual_network_dns_servers.dns1,
    time_sleep.wait_120_seconds
  ]
}

# Associate security group with network interface
resource "azurerm_network_interface_security_group_association" "my_association1" {
  network_interface_id      = azurerm_network_interface.mynetworkinterface1.id
  network_security_group_id = azurerm_network_security_group.sg-rdp-connection1.id
}




#resource "azurerm_virtual_machine_extension" "firewall" {
#  name = "firewall"
#  #  resource_group_name  = azurerm_resource_group.main.name
#  virtual_machine_id   = azurerm_windows_virtual_machine.myvirtualmachine2.id
#  publisher            = "Microsoft.Compute"
#  type                 = "CustomScriptExtension"
#  type_handler_version = "1.9"
#
#  protected_settings = <<SETTINGS
#  {    
#    "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.JOIN.rendered)}')) | Out-File -filepath JOIN.ps1\" && powershell -ExecutionPolicy Unrestricted -File JOIN.ps1"
#  }
#  SETTINGS
#
#  depends_on = [
#    time_sleep.wait_90_seconds1
#  ]
#
#}
#
##Variable input for the JOIN.ps1 script
#data "template_file" "JOIN" {
#  template = file("JOIN.ps1")
#}







resource "azurerm_virtual_machine_extension" "join-domain1" {
  name                       = "join-domain1"
  virtual_machine_id         = azurerm_windows_virtual_machine.myvirtualmachine1.id
  publisher                  = "Microsoft.Compute"
  type                       = "JsonADDomainExtension"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  # What the settings mean: https://docs.microsoft.com/en-us/windows/desktop/api/lmjoin/nf-lmjoin-netjoindomain

  settings           = <<SETTINGS
    {
        "Name": "${var.Domain_DNSName}",
        "OUPath": "",
        "User": "${var.Domain_DNSName}\\${var.win_username}",
        "Restart": "true",
        "Options": "3"
    }
SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
    {
      "Password": "${var.win_userpass}"
    }
  PROTECTED_SETTINGS
  depends_on = [
    azurerm_virtual_network_dns_servers.dns1,
    time_sleep.wait_120_seconds
  ]

}

