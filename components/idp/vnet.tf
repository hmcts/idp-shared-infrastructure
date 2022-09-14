module "vnet" {
  source                 = "git::https://github.com/hmcts/cnp-module-vnet?ref=DTSPO-9934-update-address-prefixes"
  name                   = var.vnet_name
  location               = var.location
  address_space          = var.address_space
  source_range           = var.address_space
  env                    = var.env
  lb_private_ip_address  = "10.131.1.46"
  postgresql_subnet_cidr = var.postgresql_subnet_cidr
  common_tags            = module.ctags.common_tags
  microsoft_external_dns = "168.63.129.16"
}
resource "azurerm_subnet" "iaas" {
  name                 = "iaas"
  resource_group_name  = module.vnet.resourcegroup_name
  virtual_network_name = module.vnet.vnetname
  address_prefixes     = [var.iaas]
  service_endpoints    = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "private" {
  name                 = "privateendpoints"
  resource_group_name  = module.vnet.resourcegroup_name
  virtual_network_name = module.vnet.vnetname
  address_prefixes     = [var.privateendpoints]
}

resource "azurerm_private_endpoint" "private-endpoint" {
  name                = "idp-poc-postgres-private-endpoint"
  location            = var.location
  resource_group_name = module.vnet.resourcegroup_name
  subnet_id           = azurerm_subnet.private.id

  private_service_connection {
    name                           = "idp-poc-postgres-privateserviceconnection"
    private_connection_resource_id = module.idp-poc-db.id
    is_manual_connection           = false
  }
}

resource "azurerm_subnet" "appgw" {
  name                 = "appgw"
  resource_group_name  = module.vnet.resourcegroup_name
  virtual_network_name = module.vnet.vnetname
  address_prefixes     = [var.appgw]
}