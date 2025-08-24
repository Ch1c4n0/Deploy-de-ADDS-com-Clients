variable "nameresourcegroup" {

  default     = "lab-adds-server"
  description = "Name of RG"
}

variable "nameresourcegroup2" {

  default     = "lab-adds-client"
  description = "Name of RG"
}


variable "location1" {

  default     = "eastus"
  description = "Location of VM1."
}

variable "location2" {

  default     = "centralus"
  description = "Location of VM1."
}



variable "vnet1-location" {

  default     = "eastus"
  description = "Location of the Vnet1."
}

variable "vnet2-location" {

  default     = "centralus"
  description = "Location of the Vnet2."
}

variable "vnet1-name" {

  default = "hub"

}

variable "vnet2-name" {

  default = "srv1"

}



variable "win_username" {
  description = "Windows Username"
  type        = string
  default = "adminlab"
  sensitive   = false
}

variable "win_userpass" {
  description = "Windows Password"
  type        = string
  sensitive   = true
  default     = null # Será definida pelo recurso random_password
}

variable "my_virtual_machine_size" {
  #default     = "Standard_D2_v4"
  default     = "Standard_B2ms"
  description = "Size of the Virtual Machine"
}


variable "name-vm1" {
  type        = string
  default     = "adds"
  description = "Name of the resource."
}


variable "name-vm2" {
  type        = string
  default     = "win10"
  description = "Name of the resource."
}

variable "name-vm3" {
  type        = string
  default     = "win11"
  description = "Name of the resource."
}

variable "ip_dns_adds" {

  default = "10.10.1.100"

}







