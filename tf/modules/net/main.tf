
resource "azurerm_subnet" "subnet" {
  for_each             = var.subnets
  name                 = each.value["name"]
  address_prefixes     = each.value["address_space"]
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name

  service_endpoints    = [
    "Microsoft.KeyVault",
    "Microsoft.Storage",
    "Microsoft.Sql",
    "Microsoft.EventHub"
  ]

  dynamic "delegation" {
    for_each = each.value.subnet_delegation == "true" ? [1] : []
    content {
      name = "dbr_delegation"
      service_delegation {
        name = "Microsoft.Databricks/workspaces"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action",
          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
        ]
      }
    }
  }
}

resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg
  name                = each.value["name"]
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags 
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  for_each = {
    for subnet_key, nsg_key in local.subnet_nsgs : subnet_key => {
      subnet_id = azurerm_subnet.subnet[subnet_key].id
      nsg_id    = azurerm_network_security_group.nsg[nsg_key].id
    }
    if nsg_key != null
  }

  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.nsg_id
}

resource "azurerm_subnet_route_table_association" "rta" {
  for_each       = azurerm_subnet.subnet

  subnet_id      = each.value.id
  route_table_id = data.azurerm_route_table.udr.id
}