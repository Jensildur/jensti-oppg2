locals {
  workspaces = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  net_rg_name = "${var.net_rg_name}-${local.workspaces}"
  net_sg_name = "${var.net_sg_name}-${local.workspaces}"

  sa_rg_name   = "${var.sa_rg_name}-${local.workspaces}"
  sa_base_name = "${var.sa_base_name}${local.workspaces}"

  kv_rg_name = "${var.kv_rg_name}-${local.workspaces}"

  vm_rg_name = "${var.vm_rg_name}-${local.workspaces}"

  web_rg_name = "${var.rg_web_name}-${local.workspaces}"
  sa_web_name = "${var.sa_web_name}${local.workspaces}"
  web_suffix  = "<h1>${terraform.workspace}</h1>"

}