#data "azurerm_key_vault_secret" "secret" {
#  name         = "publicsshkey"
#  key_vault_id = data.azurerm_key_vault.kv.id
#}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "secret" {
  name         = "adminuser"
  key_vault_id = module.idp-kv.key_vault_id
}

# data "azurerm_key_vault_secret" "kv_secret_id" {
#   name                = ""
#   resource_group_name = ""
#   location            = var.location
#   key_vault_secret_id = ""
# }