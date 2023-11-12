resource "azurerm_resource_group" "VM_RG" {
  name     = "VM-resources"
  location = "West Europe"
}

resource "azurerm_public_ip" "PIP" {
    name                = var.pip_name
    location            = azurerm_resource_group.VM_RG.location
    resource_group_name = azurerm_resource_group.VM_RG.name
    allocation_method   = "Dynamic"
  
}
resource "azurerm_network_interface" "network_interface" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.VM_RG.location
  resource_group_name = azurerm_resource_group.VM_RG.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.PIP.id
  }
}

resource "azurerm_linux_virtual_machine" "ubuntu-vm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.VM_RG.name
  location            = azurerm_resource_group.VM_RG.location
  size                = "Standard_F2"
  admin_username      = "admintest"
  admin_password = "Sudopassword!"
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]
  #to disable ssh_error
 disable_password_authentication = false

# not required yet
#  admin_ssh_key {
#    username   = "adminuser"
#    public_key = file("~/.ssh/id_rsa.pub")
#  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}