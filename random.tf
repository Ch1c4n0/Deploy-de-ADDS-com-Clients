resource "random_password" "win_userpass" {
  length           = 10
  special          = true
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
  override_special = "!@#$%^&*()-=+[]{};:,.<>?/"
}

output "win_userpass" {
  value     = random_password.win_userpass.result
  sensitive = true
}


