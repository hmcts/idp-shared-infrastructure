

data "azurerm_key_vault_certificate" "wildcard_cert" {
  name         = "wildcard-platform-hmcts-net"
  key_vault_id = module.idp-kv.key_vault_id
  # cert_id = "https://idp-poc-prod.vault.azure.net/certificates/wildcard-platform-hmcts-net/efcaf31f43034f5a9ed74959e698b91e/"
}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "secret" {
  name         = "adminuser"
  key_vault_id = module.idp-kv.key_vault_id
}

data "azurerm_private_dns_zone" "zone" {
  provider            = azurerm.dts-cftptl
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = "core-infra-intsvc-rg"
}
data "azurerm_private_dns_zone" "appgw" {
  provider            = azurerm.dts-cftptl
  name                = "platform.hmcts.net"
  resource_group_name = "core-infra-intsvc-rg"
}
