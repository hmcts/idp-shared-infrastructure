module "idp-kv" {
  source              = "git::https://github.com/hmcts/cnp-module-key-vault?ref=master"
  name                = "idp-poc-${var.env}"
  product             = var.product
  env                 = var.env
  resource_group_name = module.vnet.resourcegroup_name
  product_group_name  = "idp"
}