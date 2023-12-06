output "public_ip_address_vm-adds" {
  value = azurerm_windows_virtual_machine.myvirtualmachine.public_ip_address
}


output "public_ip_address_vm-win10" {
  value = azurerm_windows_virtual_machine.myvirtualmachine1.public_ip_address
}


output "public_ip_address_vm-win11" {
  value = azurerm_windows_virtual_machine.myvirtualmachine2.public_ip_address
}
