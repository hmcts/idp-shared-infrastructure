
resource "azurerm_network_interface" "app_nic" {
  name                = "idp-poc-application-nic"
  location            = var.location
  resource_group_name = module.vnet.resourcegroup_name
  tags                = module.ctags.common_tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.iaas.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "application" {
  name                            = "idp-poc-application"
  resource_group_name             = module.vnet.resourcegroup_name
  location                        = var.location
  size                            = "Standard_D8s_v3"
  admin_username                  = "adminuser"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.app_nic.id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = data.azurerm_key_vault_secret.secret.value
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 100
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  tags = module.ctags.common_tags
}


//managed disk for application vm
resource "azurerm_managed_disk" "manageddisk" {
  name                 = "idp-poc-application-disk1"
  location             = var.location
  resource_group_name  = module.vnet.resourcegroup_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 100
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.manageddisk.id
  virtual_machine_id = azurerm_linux_virtual_machine.application.id
  lun                = "10"
  caching            = "ReadWrite"
}

//trainer vm
resource "azurerm_network_interface" "trainer" {
  name                = "idp-poc-trainer-nic"
  location            = var.location
  resource_group_name = module.vnet.resourcegroup_name
  tags                = module.ctags.common_tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.iaas.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "trainer" {
  name                            = "idp-poc-trainer"
  resource_group_name             = module.vnet.resourcegroup_name
  location                        = var.location
  size                            = "Standard_D16ds_v5"
  admin_username                  = "adminuser"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.trainer.id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = data.azurerm_key_vault_secret.secret.value
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 100
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  tags = module.ctags.common_tags
}

#NSG
resource "azurerm_network_security_group" "nsg" {
  name                = "idp_nsg"
  location            = var.location
  resource_group_name = module.vnet.resourcegroup_name

  security_rule {
    name                       = "bastion"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.48.0.6"
    destination_address_prefix = "*"
  }

  tags = module.ctags.common_tags

}

resource "azurerm_subnet_network_security_group_association" "iaas" {
  subnet_id                 = azurerm_subnet.iaas.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


