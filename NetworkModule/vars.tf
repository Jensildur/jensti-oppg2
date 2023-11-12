variable "net_rg_name" {
    type = string
    description = "Resource group name"
}

variable "net_rg_location" {
    type = string
    description = "the location of the resource group"
    default = "West Europe"
}

variable "net_sg_name" {
    type = string
    description = "Network security group name"
}

variable "v_net_name" {
    type = string
    description = "Virtual network name"
}