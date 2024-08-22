data "azurerm_resource_group" "rgdatablock" {
  name = "rg-admin"
}

data "azurerm_network_interface" "nicdata" {
  for_each = var.vm
  name                = each.value.vname
  resource_group_name = data.azurerm_resource_group.rgdatablock.name
}

data "azurerm_key_vault" "key_data_block" {
  name                = "anilkumarbhardwajkey"
  resource_group_name = data.azurerm_resource_group.rgdatablock.name
}

data "azurerm_key_vault_secret" "secret_data" {
for_each = var.vm
  name         = each.value.keyname
  key_vault_id = data.azurerm_key_vault.key_data_block.id
}

