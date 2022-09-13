#data "azurerm_key_vault_secret" "secret" {
#  name         = "publicsshkey"
#  key_vault_id = data.azurerm_key_vault.kv.id
#}

data "azurerm_key_vault_secret" "kv_secret_id" {
  name                = "wildcard-platform-hmcts-net"
  key_vault_id        = module.idp-kv.key_vault_id
  key_vault_secret_id = "https://idp-poc-prod.vault.azure.net/certificates/wildcard-platform-hmcts-net/efcaf31f43034f5a9ed74959e698b91e/"
}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "secret" {
  name         = "adminuser"
  key_vault_id = module.idp-kv.key_vault_id
}
