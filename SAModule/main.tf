terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_string" "random_string" {
    length = 8
    special = false
    upper = false  
}

resource "azurerm_resource_group" "SA_RG" {
    name     = var.rg_name 
    location = var.location
}

#reference the RESOURCE rg not the variable rg_name
resource "azurerm_storage_account" "saone" {
  name                     = "${lower(var.base_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.SA_RG.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}