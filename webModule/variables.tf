variable "location" {
    type = string
    description = "the location of the resource group"
    default = "West Europe"
}

variable "rg_web_name" {
    type = string
    description = "Resource group name"
}

variable "sa_web_name" {
    type = string
    description = "Storage account name"
}

variable "index_document" {
    type = string
    description = "Index document"
}

variable "source_content" {
    type = string
    description = "Source content"
}
