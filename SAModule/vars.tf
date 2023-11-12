variable "base_name" {
    type = string
    description = "Storage account name"
}

variable "rg_name" {
    type = string
    description = "Resource group name"
}

variable "location" {
    type = string
    description = "the location of the resource group"
}

variable "sa_container_name" {
    type = string
    description = "Storage account container name"
}