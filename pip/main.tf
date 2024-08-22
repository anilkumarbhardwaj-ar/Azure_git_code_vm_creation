resource "azurerm_public_ip" "pipblock" {
  for_each = var.pip
  name                = each.value.name
  resource_group_name = each.value.rgname
  location            = each.value.location
  allocation_method   = "Static"
}