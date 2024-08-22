resource "azurerm_network_interface" "nicblock" {
    for_each = var.nic
  name                = each.value.name
  location            = data.azurerm_resource_group.rgdatablock.location
  resource_group_name = data.azurerm_resource_group.rgdatablock.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subdatablock[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}