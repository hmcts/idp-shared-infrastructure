module "vnet" {
  source                        = "git::https://github.com/hmcts/cnp-module-vnet?ref=fix-address-prefix"
  name                          = var.vnet_name
  location                      = var.location
  address_space                 = var.address_space
  source_range                  = var.address_space
  env                           = var.env
  lb_private_ip_address         = cidrhost(cidrsubnet(var.address_space, 4, 2), -2)
  postgresql_subnet_cidr_blocks = var.postgresql_subnet_cidr_blocks
  common_tags                   = module.ctags.common_tags
}