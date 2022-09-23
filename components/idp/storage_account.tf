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
  role_assignments = [
    "Storage Blob Delegator",
    "Storage Blob Data Contributor",
  "Storage Blob Data Reader"]
  managed_identity_object_id = data.azurerm_client_config.current.object_id
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
<<<<<<< HEAD
=======

>>>>>>> 5bbcf19 (newstorageforfileshare)
module "storage_account_hyperscience" {
  source                    = "git::https://github.com/hmcts/cnp-module-storage-account?ref=master"
  env                       = var.env
  storage_account_name      = "idppochypersciencefile"
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
    "/subscriptions/a0939257-9c73-48ab-8daa-51cd49ef6c42/resourceGroups/idp-poc-infra-prod/providers/Microsoft.Network/virtualNetworks/idp-poc-infra-vnet-prod/subnets/iaas",
<<<<<<< HEAD
    "/subscriptions/2b1afc19-5ca9-4796-a56f-574a58670244/resourceGroups/bastion-prod-rg/providers/Microsoft.Network/virtualNetworks/bastion-prod-vnet/subnets/bastion"]
 }
=======
  "/subscriptions/2b1afc19-5ca9-4796-a56f-574a58670244/resourceGroups/bastion-prod-rg/providers/Microsoft.Network/virtualNetworks/bastion-prod-vnet/subnets/bastion"]
}
>>>>>>> 5bbcf19 (newstorageforfileshare)
