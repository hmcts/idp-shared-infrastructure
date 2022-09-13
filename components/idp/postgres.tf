data "azurerm_subnet" "postgres" {
  name                 = "idp-poc-subnet-0-${var.env}"
  resource_group_name  = "idp-poc-${var.env}"
  virtual_network_name = "idp-poc-infra-${var.env}"
}

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
  subnet_id          = module.vnet.postgresql_subnet_id[0]
  sku_name           = "GP_Gen5_2"
  sku_tier           = "GeneralPurpose"
  subscription       = var.subscription
  common_tags        = module.ctags.common_tags
  key_vault_name     = module.idp-kv.key_vault_name
  key_vault_rg       = module.vnet.resourcegroup_name
}