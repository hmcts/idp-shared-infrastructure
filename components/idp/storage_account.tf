module "storage_account_azcopy" {
  source                    = "git@github.com:hmcts/cnp-module-storage-account?ref=master"
  env                       = var.env
  storage_account_name      = "idp-poc-azcopy"
  resource_group_name       = module.vnet.resource_group_name
  location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "ZRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  sa_subnets                = module.vnet.subnet_id
  common_tags               = module.ctags.common_tags
}

module "storage_account_hyperscience" {
  source                    = "git@github.com:hmcts/cnp-module-storage-account?ref=master"
  env                       = var.env
  storage_account_name      = "idp-poc-hyperscience"
  resource_group_name       = module.vnet.resource_group_name
  location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "ZRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  sa_subnets                = module.vnet.subnet_id
  common_tags               = module.ctags.common_tags
}
