data "azurerm_key_vault_secret" "secret" {
  name         = "publicsshkey"
  key_vault_id = data.azurerm_key_vault.kv.id
}