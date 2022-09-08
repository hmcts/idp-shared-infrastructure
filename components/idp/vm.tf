resource "azurerm_network_interface" "app_nic" {
  name                = "idp-poc-application-nic"
  location            = var.location
  resource_group_name = module.vnet.resource_group_name
  tags                = module.ctags.common_tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "application" {
  name                            = "idp-poc-application"
  resource_group_name             = module.vnet.resource_group_name
  location                        = var.location
  size                            = "D8s_v3"
  admin_username                  = "adminuser"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.app_nic.id
  ]

  admin_ssh_key {
    username   = "adminuser"
    #public_key = # key needed here
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 100
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }
  tags = module.ctags.common_tags
}

resource "azurerm_linux_virtual_machine" "trainer" {
  name                            = "idp-poc-trainer"
  resource_group_name             = module.vnet.resource_group_name
  location                        = var.location
  size                            = "D16ads_v5"
  admin_username                  = "adminuser"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.app_nic.id
  ]

  admin_ssh_key {
    username   = "adminuser"
    #public_key = # key needed here
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 100
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }
  tags = module.ctags.common_tags
}