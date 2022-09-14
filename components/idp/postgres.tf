
module "idp-poc-db" {
  source             = "git::https://github.com/hmcts/cnp-module-postgres?ref=postgresql_tf"
  product            = var.product
  component          = var.component
  name               = join("-", [var.product, var.component, "postgres-db-v11"])
  location           = var.location_db
  env                = var.env
  database_name      = var.database_name
  postgresql_user    = var.postgresql_user
  postgresql_version = "11"
  subnet_id          = azurerm_subnet.private.id
  sku_name           = "GP_Gen5_2"
  sku_tier           = "GeneralPurpose"
  subscription       = var.subscription
  common_tags        = module.ctags.common_tags
  key_vault_name     = module.idp-kv.key_vault_name
  key_vault_rg       = module.vnet.resourcegroup_name
}

data "azurerm_private_dns_zone" "zone" {
  provider            = azurerm.dts-cftptl
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = "core-infra-intsvc-rg"
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  name                  = "idp-poc-prod"
  resource_group_name   = "core-infra-intsvc-rg"
  private_dns_zone_name = data.azurerm_private_dns_zone.zone.name
  virtual_network_id    = module.vnet.vnet_id
}