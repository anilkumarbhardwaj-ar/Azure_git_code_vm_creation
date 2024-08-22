resource "azurerm_network_security_group" "nsgblock" {
    for_each = var.nsg
  name                = each.value.name
  location            = data.azurerm_resource_group.rgdatablock.location
  resource_group_name = data.azurerm_resource_group.rgdatablock.name

  security_rule {
    name                       = "test123"
    priority                   = each.value.security_rule.priority
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = each.value.security_rule.source_port_range
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}