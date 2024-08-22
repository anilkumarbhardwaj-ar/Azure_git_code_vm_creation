resource "azurerm_bastion_host" "bastion_block" {
    for_each = var.bas
  name                = each.value.name
  location            = data.azurerm_resource_group.rgdatablock.location
  resource_group_name = data.azurerm_resource_group.rgdatablock.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subdatablock[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip_data_block[each.key].id
  }
}