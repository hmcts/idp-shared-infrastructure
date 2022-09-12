 HUB Peering
 resource "azurerm_virtual_network_peering" "initiator-To-targethub" {
   #provider = azurerm.initiator

   name                         = "idptoprodhub"
   resource_group_name          = module.vnet.resourcegroup_name
   virtual_network_name         = module.vnet.vnetname
   remote_virtual_network_id    = data.azurerm_virtual_network.hub.id
   allow_virtual_network_access = true
   allow_forwarded_traffic      = true

 }

 resource "azurerm_virtual_network_peering" "targethub-To-initiator" {
   provider = azurerm.hub-prod

   name                         = "prodhubtoidp"
   resource_group_name          = "hmcts-hub-nonprodi"
   virtual_network_name         = "hmcts-hub-nonprodi"
   remote_virtual_network_id    = module.vnet.vnet_id
   allow_virtual_network_access = true
   allow_forwarded_traffic      = true

 }
 data "azurerm_virtual_network" "hub" {
   provider            = azurerm.hub-prod
   name                = "hmcts-hub-nonprodi"
   resource_group_name = "hmcts-hub-nonprodi"
 }


 VPN peering
 resource "azurerm_virtual_network_peering" "initiator-To-targetvpn" {
   #provider = azurerm.initiator

   name                         = "idptovpn"
   resource_group_name          = module.vnet.resourcegroup_name
   virtual_network_name         = module.vnet.vnetname
   remote_virtual_network_id    = data.azurerm_virtual_network.vpn.id
   allow_virtual_network_access = true
   allow_forwarded_traffic      = true

 }

 resource "azurerm_virtual_network_peering" "targetvpn-To-initiator" {
   provider = azurerm.vpn

   name                         = "vpntoidp"
   resource_group_name          = "rg-mgmt"
   virtual_network_name         = "core-infra-vnet-mgmt"
   remote_virtual_network_id    = module.vnet.vnet_id
   allow_virtual_network_access = true
   allow_forwarded_traffic      = true

 }

 data "azurerm_virtual_network" "vpn" {
   provider            = azurerm.hub-prod
   name                = "core-infra-vnet-mgmt"
   resource_group_name = "rg-mgmt"
 }
