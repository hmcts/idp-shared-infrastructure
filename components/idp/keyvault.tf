module "idp-kv" {
  source              = "git::https://github.com/hmcts/cnp-module-key-vault?ref=master"
  name                = "idp-poc-${var.env}"
  product             = var.product
  env                 = var.env
  resource_group_name = module.vnet.resourcegroup_name
  object_id           = "531ff96d-0ae9-462a-8d2d-bec7c0b42082"
  product_group_name  = "DTS IDP POC"
  common_tags         = module.ctags.common_tags
}
