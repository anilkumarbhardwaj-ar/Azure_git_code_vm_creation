# Adding the value in resource group
rgname = {
  rg1 = {
    name     = "rgdev"
    location = "Central india"
  }
  rg2 = {
    name     = "rgpro"
    location = "west us"
  }
}

# adding the value in  Vitual private network

vnet = {
  vnet1 = {

    name                 = "vnetdev"
    resource_group_name  = "rgdev"
    virtual_network_name = "vnet"
    address_prefixes     = ["10.0.2.0/24"]

  }
  vnet2 = {

    name                 = "vnetpro"
    resource_group_name  = "rgpro"
    virtual_network_name = "vnet"
    address_prefixes     = ["192.168.2.0/24"]
  }

}
# Adding the value in  Subnet


subnet = {
  sub1 = {
    name             = "subdev"
    rgname           = "rgdev"
    vnetname         = "vnetdev"
    address_prefixes = ["10.0.1.0/24"]
  }

  sub2 = {
    name                 = "subpro"
    resource_group_name  = "rgpro"
    virtual_network_name = "vnetpro"
    address_prefixes     = ["192.168.1.0/24"]
  }

}



# Adding the value in  Network security group  


nsgroup = {
  nsg1 = {
    name     = "nsgdev"
    location = "central india"
    rgname   = "rgdev"
  }

  nsg2 = {
    name     = "nsgpro"
    location = "west us"
    rgname   = "rgpro"
  }

}

# Adding the value in  public IP Address

pip = {
  pip1 = {

    name              = "pipdev"
    rgname            = "rgdev"
    location          = "central india"
    allocation_method = "Static"
  }

  pip2 = {

    name              = "pippro"
    rgname            = "rgpro"
    location          = "west us"
    allocation_method = "Static"
  }
}



# Adding the value in  NIC

nic = {
  nic1 = {
    name     = "nicdev"
    location = "Central India"
    rgname   = "rgdev"
  }
  nic2 = {
    name     = "nicpro"
    location = "west us"
    rgname   = "rgpro"
  }
}



# Adding the value in VM

vmroot = {
  vm1 = {

    name                  = "vmdev"
    location              = "Central India"
    rgname                = "rgdev"
    network_interface_ids = [azurerm_network_interface.main.id]
    vm_size               = "Standard_DS1_v2"
  }
  vm2 = {

    name                  = "vmpro"
    location              = "west us"
    rgname                = "rgpro"
    network_interface_ids = [azurerm_network_interface.main.id]
    vm_size               = "Standard_DS1_v2"
  }
}



