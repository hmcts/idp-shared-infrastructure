resource "azurerm_public_ip" "idp" {
  name                = "idp-appgw-fe-ip"
  resource_group_name = module.vnet.resourcegroup_name
  location            = var.location
  allocation_method   = "Dynamic"
}


resource "azurerm_application_gateway" "idp" {
  name                = "idp-poc-appgw"
  resource_group_name = module.vnet.resourcegroup_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "idp-poc-config"
    subnet_id = azurerm_subnet.appgw.id
  }

  frontend_port {
    name = "idp-poc-appgw-fe"
    port = 443
  }

  frontend_ip_configuration {
    name                 = "idp-poc-fe-config"
    public_ip_address_id = azurerm_public_ip.idp.id
  }

  backend_address_pool {
    name         = "idp-poc-be-address-pool"
    ip_addresses = [azurerm_network_interface.app_nic.private_ip_address, azurerm_network_interface.trainer.private_ip_address]
  }

  backend_http_settings {
    name                  = "http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 30
  }

  http_listener {
    name                           = "listener"
    frontend_ip_configuration_name = "idp-poc-fe-config"
    frontend_port_name             = "idp-poc-appgw-fe"
    protocol                       = "Https"
    ssl_certificate_name           = "wildcard-platform-hmcts-net"
  }

  ssl_certificate {
    name                = "wildcard-platform-hmcts-net"
    key_vault_secret_id = data.azurerm_key_vault_certificate.wildcard_cert.secret_id
  }

  request_routing_rule {
    name                       = "request-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "listener"
    backend_address_pool_name  = "idp-poc-be-address-pool"
    backend_http_settings_name = "http-settings"
    priority                   = 1
  }
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.id-agw.id]
  }
}


resource "azurerm_user_assigned_identity" "id-agw" {
  resource_group_name = module.vnet.resourcegroup_name
  location            = var.location
  name                = "idp-aggw-mi"
}
