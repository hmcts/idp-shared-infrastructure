#data "azurerm_key_vault_secret" "secret" {
#  name         = "publicsshkey"
#  key_vault_id = data.azurerm_key_vault.kv.id
#}

data "azurerm_key_vault_secret" "wildcard_cert" {
  name         = "wildcard-platform-hmcts-net"
  key_vault_id = module.idp-kv.key_vault_id
  cert_id = "https://idp-poc-prod.vault.azure.net/certificates/wildcard-platform-hmcts-net/efcaf31f43034f5a9ed74959e698b91e/"
}
data "azurerm_role_definition" "storage_role" {
  name = "Storage File Data SMB Share Contributor"
}
data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "secret" {
  name         = "adminuser"
  key_vault_id = module.idp-kv.key_vault_id
}
