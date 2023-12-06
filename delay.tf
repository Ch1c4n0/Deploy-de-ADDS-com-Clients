#resource "time_sleep" "wait_90_seconds1" {
#  depends_on = [azurerm_windows_virtual_machine.myvirtualmachine2]
#
#  create_duration = "90s"
#}
#
#
#resource "time_sleep" "wait_90_seconds2" {
#  depends_on = [azurerm_windows_virtual_machine.myvirtualmachine1]
#
#  create_duration = "90s"
#}
#
#
#
#resource "time_sleep" "wait_120_seconds1" {
#  depends_on = [azurerm_windows_virtual_machine.myvirtualmachine2]
#
#  create_duration = "120s"
#}
#
#
#resource "time_sleep" "wait_120_seconds2" {
#  depends_on = [azurerm_windows_virtual_machine.myvirtualmachine1]
#
#  create_duration = "120s"
#}
#
#
#resource "time_sleep" "wait_120_seconds3" {
#  depends_on = [azurerm_virtual_machine_extension.install_ad]
#
#  create_duration = "120s"
#}

resource "time_sleep" "wait_120_seconds" {
  depends_on = [azurerm_virtual_machine_extension.install_ad]

  create_duration = "120s"
}