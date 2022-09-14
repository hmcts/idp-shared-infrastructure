module "idp-kv" {
  source                      = "git::https://github.com/hmcts/cnp-module-key-vault?ref=master"
  name                        = "idp-poc-${var.env}"
  product                     = var.product
  env                         = var.env
  resource_group_name         = module.vnet.resourcegroup_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  object_id                   = data.azurerm_client_config.current.object_id
  product_group_name          = "DTS IDP POC"
  common_tags                 = module.ctags.common_tags
  managed_identity_object_ids = [azurerm_user_assigned_identity.id-agw.principal_id]
}