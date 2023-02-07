resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.rsg_name
  location            = var.location
  sku                 = "Basic"
}