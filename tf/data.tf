// returns the Service Principal, to be added to AKS RBAC.
data azurerm_client_config "current" {}

data "azurerm_virtual_network" "vnt" {
  name                = var.VNT_NAME
  resource_group_name = var.VNT_RSG
}

data "azurerm_key_vault" "kvt" {
  name                = local.kvt
  resource_group_name = local.rsg
}

data "azurerm_key_vault_secret" "sp" {
  name         = "sec-spdataserv"
  key_vault_id = data.azurerm_key_vault.kvt.id
}

data "azurerm_databricks_workspace" "dbr001" {
  name                = local.dbr001
  resource_group_name = local.rsg
}