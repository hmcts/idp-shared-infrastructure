module "storage_account_azcopy" {
  source                    = "git::https://github.com/hmcts/cnp-module-storage-account?ref=master"
  env                       = var.env
  storage_account_name      = "idppocazcopy"
  resource_group_name       = module.vnet.resourcegroup_name
  location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "ZRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  #sa_subnets                = module.vnet.subnet_ids
  common_tags    = module.ctags.common_tags
  default_action = "Allow"
}

//resource "azurerm_storage_share" "example" {
//  name                 = "azcopy"
//  storage_account_name = module.storage_account_azcopy.storageaccount_name
//  quota                = var.size_of_fileshare
//
//}

module "storage_account_hyperscience" {
  source                    = "git::https://github.com/hmcts/cnp-module-storage-account?ref=master"
  env                       = var.env
  storage_account_name      = "idppochyperscience"
  resource_group_name       = module.vnet.resourcegroup_name
  location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "ZRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  #sa_subnets                = module.vnet.subnet_ids
  common_tags    = module.ctags.common_tags
  default_action = "Allow"
}
