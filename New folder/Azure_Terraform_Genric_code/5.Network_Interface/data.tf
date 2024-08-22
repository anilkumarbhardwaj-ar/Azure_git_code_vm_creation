data "azurerm_resource_group" "rgdatablock" {
  name = "rg-admin"
}

data "azurerm_virtual_network" "datavirtualnetwork" {
  name                = "vnet-admin1"
  resource_group_name = data.azurerm_resource_group.rgdatablock.name
}


data "azurerm_subnet" "subdatablock" {
  for_each = var.nic
  name                 = each.value.sname
  virtual_network_name = data.azurerm_virtual_network.datavirtualnetwork.name
  resource_group_name  = data.azurerm_resource_group.rgdatablock.name
}