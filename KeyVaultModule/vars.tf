variable "kv_rg_location" {
    type = string
    description = "the location of the Key Vault resource group"
}

variable "kv_rg_name" {
    type = string
    description = "Key Vault Resource group name"
}

variable "kv_name" {
    type = string
    description = "Key Vault name"
}

variable "kv_sa_key_desc" {
    type = string
    description = "Storage account access key descriptor"
    default = "sa-access-key-name"
}

variable "kv_sa_key" {
    type = string
    description = "Storage account access key"
}

variable "kv_sa_name" {
    type = string
    description = "Key Vault storage account name"
}