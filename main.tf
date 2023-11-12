terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "3.71.0"
        }
    }
}

provider "azurerm" {
    features {}
}

module "KeyVault" {
    source = "./KeyVaultModule"
    kv_rg_name = var.kv_rg_name
    kv_name = var.kv_name
    kv_rg_location = var.kv_rg_location
    kv_secret = var.kv_secret
    kv_secret_value = var.kv_secret_value
}

module "StorageAccount" {
  source = "./SAModule"
  base_name = var.sa_base_name
  rg_name = var.sa_rg_name
  location = var.sa_location
}

#subnet names hardcoded for now...
module "Network" {
  source = "./NetworkModule"
  net_rg_name = var.net_rg_name
  v_net_name = var.v_net_name
  net_sg_name = var.net_sg_name
}

module "VirtualMachine" {
    source = "./VMModule"
    vm_rg_name = var.vm_rg_name
    vm_name = var.vm_name
    vm_rg_location = var.vm_location
    network_interface_name = var.vm_network_interface_name
    subnet_id = module.Network.subnet_id_output
    pip_name = var.vm_pip_name
}
  
