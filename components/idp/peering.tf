// HUB Peering
// resource "azurerm_virtual_network_peering" "initiator-To-targethub" {
//   #provider = azurerm.initiator
//
//   name                         = var.initiator_peer_name
//   resource_group_name          = var.initiator_vnet_resource_group
//   virtual_network_name         = var.initiator_vnet
//   remote_virtual_network_id    = data.azurerm_virtual_network.target.id
//   allow_virtual_network_access = true
//   allow_forwarded_traffic      = true
//
// }
//
// resource "azurerm_virtual_network_peering" "targethub-To-initiator" {
//   provider = azurerm.hub-prod
//
//   name                         = var.target_peer_name
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
//   name                         = var.initiator_peer_name
//   resource_group_name          = var.initiator_vnet_resource_group
//   virtual_network_name         = var.initiator_vnet
//   remote_virtual_network_id    = data.azurerm_virtual_network.target.id
//   allow_virtual_network_access = true
//   allow_forwarded_traffic      = true
//
// }
//
// resource "azurerm_virtual_network_peering" "targetvpn-To-initiator" {
//   provider = azurerm.vpn
//
//   name                         = var.target_peer_name
//   resource_group_name          = var.target_vnet_resource_group
//   virtual_network_name         = var.target_vnet
//   remote_virtual_network_id    = data.azurerm_virtual_network.initiator.id
//   allow_virtual_network_access = true
//   allow_forwarded_traffic      = true
//
// }
//
