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

variable "kv_secret" {
    type = string
    description = "Key Vault secret name"
}

variable "kv_secret_value" {
    type = string
    description = "Key Vault secret value"
}