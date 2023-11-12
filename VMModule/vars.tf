variable "network_interface_name" {
    type = string
    description = "Network interface name"
}

variable "subnet_id" {
    type = string
    description = "Subnet id, from output of network module"
}

variable "pip_name" {
    type = string
    description = "Public IP name"
}

variable "vm_rg_name" {
    type = string
    description = "Resource group name for VM "
}

variable "vm_rg_location" {
    type = string
    description = "the location of the resource group"
}

variable "vm_name" {
    type = string
    description = "Virtual machine name"
}