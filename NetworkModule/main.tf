#working state FINALLY

resource "azurerm_resource_group" "net_rg" {
  name     = var.net_rg_name
  location = var.net_rg_location
}



resource "azurerm_network_security_group" "net_sg" {
  name                = var.net_sg_name
  location            = azurerm_resource_group.net_rg.location
  resource_group_name = azurerm_resource_group.net_rg.name


#base values, allow all ports over tcp
  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "81.166.229.139"
    destination_address_prefix = "*"
  }

}

# Create virtual network with defaults (two subnets)
resource "azurerm_virtual_network" "v_net" {
  name                = var.v_net_name
  location            = azurerm_resource_group.net_rg.location
  resource_group_name = azurerm_resource_group.net_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

#could probably be randomized
#Create standalone subnet resources, referencing this is cancerous
#  subnet {
#    name           = "subnet1"
#    address_prefix = "10.0.1.0/24"
#  }
#
#  subnet {
#    name           = "subnet2"
#    address_prefix = "10.0.2.0/24"
#    security_group = azurerm_network_security_group.net_sg.id
#  }
}

resource "azurerm_subnet" "subnet_one" {
    name                 = "subnet1"
    resource_group_name  = azurerm_resource_group.net_rg.name
    virtual_network_name = azurerm_virtual_network.v_net.name
    address_prefixes     = ["10.0.1.0/24"]
  
}

resource azurerm_subnet_network_security_group_association "net_sg_assoc" {
  #subnet_id                 = azurerm_virtual_network.v_net.subnet.id
  subnet_id                 = azurerm_subnet.subnet_one.id
  network_security_group_id = azurerm_network_security_group.net_sg.id
}