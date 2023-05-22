resource "azurerm_virtual_machine" "vm" {
  name                     = var.virtual-machine-name
  resource_group_name      = var.resource-group-name
  location                 = var.resource-group-location
  network_interface_ids    = [var.webSubnet_nic_id]
  vm_size                  = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "20.04.202305150"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    env = var.environment-value
  }
}