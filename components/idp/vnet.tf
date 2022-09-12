module "vnet" {
  source                        = "git::https://github.com/hmcts/cnp-module-vnet?ref=DTSPO-9934-update-address-prefixes"
  name                          = var.vnet_name
  location                      = var.location
  address_space                 = var.address_space
  source_range                  = var.address_space
  env                           = var.env
  lb_private_ip_address         = "10.131.1.46"
  postgresql_subnet_cidr_blocks = var.postgresql_subnet_cidr_blocks
  postgresql_subnet_cidr        = var.postgresql_subnet_cidr
  common_tags                   = module.ctags.common_tags
  microsoft_external_dns        = ["168.63.129.16"]
}
