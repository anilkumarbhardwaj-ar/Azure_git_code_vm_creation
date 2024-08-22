
resource "azurerm_public_ip" "pip_block" {
  for_each = var.pip
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rgdatablock.name
  location            = data.azurerm_resource_group.rgdatablock.location
  allocation_method   = "Static"

 
}
