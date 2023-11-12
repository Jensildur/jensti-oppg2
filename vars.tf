variable "sa_rg_name" {
    type = string
    description = "Resource group name"
    default = "sargone"
}

variable "sa_location" {
    type = string
    description = "the location of the resource group"
    default = "West Europe"
}

variable "sa_base_name" {
    type = string
    description = "Storage account name"
    default = "sabasename"
}

variable "net_rg_name" {
    type = string
    description = "Virtual network name"
    default = "net-rg-name"
}

variable "net_rg_location" {
    type = string
    description = "the location of the Virtual Network"
    default = "West Europe"
}

variable "net_sg_name" {
    type = string
    description = "Network security group name"
    default = "net-sg-1"
}

variable "v_net_name" {
    type = string
    description = "Virtual network name"
    default = "virtual-network-1"
}

variable "vm_name" {
    type = string
    description = "virtual machine name"
    default = "vm-1"
}

variable "vm_location" {
    type = string
    description = "the location of the virtual machine"
    default = "West Europe"
}

variable "vm_network_interface_name" {
    type = string
    description = "the name of the network interface"
    default = "eth0"
}

variable "vm_pip_name" {
    type = string
    description = "the name of the public ip"
    default = "pip-1"
}

variable "vm_rg_name" {
    type = string
    description = "the name of the VM resource group"
    default = "vm-rg-1"
}

variable "kv_rg_location" {
    type = string
    description = "the location of the Key Vault resource group"
    default = "West Europe"
}

variable "kv_rg_name" {
    type = string
    description = "Key Vault Resource group name"
    default = "kv-rg-1"
}

variable "kv_name" {
    type = string
    description = "Key Vault name"
    default = "kv-1"
}

variable "kv_secret" {
    type = string
    description = "Key Vault secret name"
    default = "Dummy-secret"
}

variable "kv_secret_value" {
    type = string
    description = "Key Vault secret value"
    default = "dummy-secret-value"
}
