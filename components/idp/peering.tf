// HUB Peering
// resource "azurerm_virtual_network_peering" "initiator-To-targethub" {
//   #provider = azurerm.initiator
//
//   name                         = "idptoprodhub"
//   resource_group_name          = module.vnet.resourcegroup_name
//   virtual_network_name         = module.vnet.vnetname
//   remote_virtual_network_id    = data.azurerm_virtual_network.target.id
//   allow_virtual_network_access = true
//   allow_forwarded_traffic      = true
//
// }
//
// resource "azurerm_virtual_network_peering" "targethub-To-initiator" {
//   provider = azurerm.hub-prod
//
//   name                         = "prodhubtoidp"
//   resource_group_name          = "hmcts-hub-nonprodi"
//   virtual_network_name         = "hmcts-hub-nonprodi"
//   remote_virtual_network_id    = data.azurerm_virtual_network.initiator.id
//   allow_virtual_network_access = true
//   allow_forwarded_traffic      = true
//
// }
//
// VPN peering
// resource "azurerm_virtual_network_peering" "initiator-To-targetvpn" {
//   #provider = azurerm.initiator
//
//   name                         = "idptovpn"
//   resource_group_name          = module.vnet.resourcegroup_name
//   virtual_network_name         = module.vnet.vnetname
//   remote_virtual_network_id    = data.azurerm_virtual_network.target.id
//   allow_virtual_network_access = true
//   allow_forwarded_traffic      = true
//
// }
//
// resource "azurerm_virtual_network_peering" "targetvpn-To-initiator" {
//   provider = azurerm.vpn
//
//   name                         = "vpntoidp"
//   resource_group_name          = var.target_vnet_resource_group
//   virtual_network_name         = var.target_vnet
//   remote_virtual_network_id    = data.azurerm_virtual_network.initiator.id
//   allow_virtual_network_access = true
//   allow_forwarded_traffic      = true
//
// }
//
