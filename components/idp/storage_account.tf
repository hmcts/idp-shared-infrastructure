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
  common_tags = module.ctags.common_tags
  sa_subnets  = [azurerm_subnet.iaas.id]
}

resource "azurerm_storage_share" "share" {
  name                 = "idpazcopy"
  storage_account_name = module.storage_account_azcopy.storageaccount_name
  quota                = var.size_of_fileshare

}
resource "azurerm_role_assignment" "af_role" {
  scope              = module.storage_account_azcopy.storageaccount_id
  role_definition_id = data.azurerm_role_definition.storage_role.id
  principal_id       = data.azurerm_client_config.current.object_id
}


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
  common_tags = module.ctags.common_tags
  sa_subnets = [
  "/subscriptions/a0939257-9c73-48ab-8daa-51cd49ef6c42/resourceGroups/idp-poc-infra-prod/providers/Microsoft.Network/virtualNetworks/idp-poc-infra-vnet-prod/subnets/iaas"]

}
