resource "azurerm_public_ip" "idp" {
  name  = "idp-appgw-fe-ip"
  resource_group_name = module.vnet.resource_group_name
  location = var.location
  allocation_method = "Dynamic"
}


resource "azurerm_application_gateway" "idp" {
  name                = "idp-poc-appgw"
  resource_group_name = module.vnet.resource_group_name
  location            = var.location

  sku { 
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "idp-poc-config"
    subnet_id = var.azurerm_subnet.appgw.id
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
    name = "idp-poc-be-address-pool"
  }

  backend_http_settings {
    name                  = "http-settings"
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "listener"
    frontend_ip_configuration_name = "idp-poc-fe-config"
    frontend_port_name             = "idp-poc-appgw-fe"
    protocol                       = "Https"
    ssl_certificate_name           = "platform-wildcard-cert"
  }

  ssl_certificate {
    name                = "platform-wildcard-cert"
    key_vault_secret_id = data.azurerm_key_vault_secret.kv_secret_id.key_vault_secret_id
  }

  request_routing_rule {
    name                       = "request-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "listener"
    backend_address_pool_name  = "idp-poc-be-address-pool"
    backend_http_settings_name = "http-setting"
  }
}