output "sa_name_output" {
    value = azurerm_storage_account.saone.name
  
}

output "blob_container_name_output" {
    value = azurerm_storage_container.sacone.name 
}

output "p_access_key_output" {
    value = azurerm_storage_account.saone.primary_access_key
}