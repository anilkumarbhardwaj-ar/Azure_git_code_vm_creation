resource "azurerm_network_interface" "nicblock" {
  for_each = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name =  each.value.rgname

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.nicblock.id
    private_ip_address_allocation = "Dynamic"
  }

}