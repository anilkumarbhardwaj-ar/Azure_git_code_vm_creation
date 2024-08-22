resource "azurerm_key_vault" "key_vault_block" {
  name                        = "anilkumarbhardwajkey"
  location                    = data.azurerm_resource_group.rgdatablock.location
  resource_group_name         = data.azurerm_resource_group.rgdatablock.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      
     "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
    

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "secret_block" {
    for_each = var.key
  name         = each.value.name
  value        = each.value.vname
  key_vault_id = azurerm_key_vault.key_vault_block.id
}