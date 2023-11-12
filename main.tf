

terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "3.71.0"
        }
    }

    backend "azurerm" {
        resource_group_name  = "rg-backend-tfstate"
        storage_account_name = "sabackend1112"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
      
    }
}

provider "azurerm" {
    features {}
}

module "KeyVault" {
    source = "./KeyVaultModule"
    kv_rg_name = local.kv_rg_name
    kv_name = var.kv_name
    kv_rg_location = var.kv_rg_location
    kv_sa_key = module.StorageAccount.p_access_key_output
    kv_sa_name = module.StorageAccount.sa_name_output
}

module "StorageAccount" {
  source = "./SAModule"
  base_name = var.sa_base_name
  rg_name = local.sa_rg_name
  location = var.sa_location
  sa_container_name = var.sa_container_name
}

#subnet names hardcoded for now...
module "Network" {
  source = "./NetworkModule"
  net_rg_name = local.net_rg_name
  v_net_name = var.v_net_name
  net_sg_name = local.net_sg_name
}

module "VirtualMachine" {
    source = "./VMModule"
    vm_rg_name = local.vm_rg_name
    vm_name = var.vm_name
    vm_rg_location = var.vm_location
    network_interface_name = var.vm_network_interface_name
    subnet_id = module.Network.subnet_id_output
    pip_name = var.vm_pip_name
}

module "webModule"{
    source = "./webModule"
    rg_web_name = local.web_rg_name
    sa_web_name = var.sa_web_name
    index_document = var.index_document
    source_content = var.source_content
}
  
