#output to return subnet id to root module
output "subnet_id_output" {
  value = azurerm_subnet.subnet_one.id
}