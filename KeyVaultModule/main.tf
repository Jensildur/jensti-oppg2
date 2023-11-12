provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

resource "random_string" "random_string" {
    length = 5
    special = false
    upper = false
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "KV_RG" {
  name     = var.kv_rg_name
  location = var.kv_rg_location
}

resource "azurerm_key_vault" "kv_one" {
  name                        = "${var.kv_name}${random_string.random_string.result}"
  location                    = azurerm_resource_group.KV_RG.location
  resource_group_name         = azurerm_resource_group.KV_RG.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

     key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "kv_secret" {
  name         = var.kv_sa_key_desc
  value        = var.kv_sa_key
  key_vault_id = azurerm_key_vault.kv_one.id
  depends_on = [ var.kv_sa_name ]
}