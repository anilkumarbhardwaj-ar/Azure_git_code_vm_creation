resource "azurerm_subnet" "subnetblock" {
    for_each = var.subnet
  name                 = each.value.name
  resource_group_name  = data.azurerm_resource_group.rgdatablock.name
  virtual_network_name = data.azurerm_virtual_network.datavirtualnetwork.name
  address_prefixes     = each.value.address_prefixes
}