# Addting the value in the Resource group
module "modrg" {
    source = "../1. Resource_Group"
    rgname = var.rgname
  
}
# Addting the value in the Network security group

module "modnsg" {
    source = "../2.Network_Security_Group"
    nsg = var.nsg 
    depends_on = [module.modrg]
}

# Addting the value in the Virtual Network 
module "modvnet" {
    source = "../3.Virtual_Network"
  vnet = var.vnet

depends_on = [ module.modrg ]

}
# Addting the value in the Subnet 
module "modsub" {
    source = "../4.Subnet"
    subnet = var.subnet
    depends_on = [ module.modvnet,module.modrg ]
}

# Addting the value in the Network Interface (NIC)
module "modnic" {
    source = "../5.Network_Interface"
    nic = var.nic
    depends_on = [ module.modsub,module.modrg,module.modvnet ]
}
# Addting the value in the vm 
module "modvm" {
    source = "../6.Virtual_Machine"
    vm = var.vm
  depends_on = [ module.modrg,module.modnic ]
}
# Addting the value in the pip

module "modpip" {
  source = "../6.1 Public_IP"
  pip = var.pip

  depends_on = [ module.modrg ]
}
# Addting the value in the Bastion
module "modbastion" {
  source = "../7.Bastion"
  bas = var.bas
  depends_on = [ module.modrg,module.modsub,module.modpip ]
}

# Addting the value in the Key

module "modkey" {
    source = "../8.Key_Vault"
    key = var.key
  depends_on = [ module.modrg ]
}