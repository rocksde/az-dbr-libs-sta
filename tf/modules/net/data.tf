data "azurerm_route_table" "udr" {
  name                = var.udr
  resource_group_name = var.resource_group_name
}