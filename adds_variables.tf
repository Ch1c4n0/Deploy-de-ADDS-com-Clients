variable "Domain_DNSName" {
  description = "FQDN for the Active Directory Forest Root Domain"
  type        = string
  default     = "intune.lab"
  sensitive   = false
}

variable "netbios_name" {
  description = "NETBIOS Name for the AD Domain"
  type        = string
  default     = "INTUNE"
  sensitive   = false
}

variable "SafeModeAdministratorPassword" {
  description = "Password for AD Safe Mode Recovery"
  type        = string
  default     = "Habemuspapam654321@"
  sensitive   = true
}

#Variable input for the ADDS.ps1 script
data "template_file" "ADDS" {
  template = file("ADDS.ps1")
  vars = {
    Domain_DNSName                = "${var.Domain_DNSName}"
    Domain_NETBIOSName            = "${var.netbios_name}"
    SafeModeAdministratorPassword = "${var.SafeModeAdministratorPassword}"
  }
}
