# creating resource group
module "modrg" {
  source = "../rgs"
  rgname = var.rgname
}

# creating resource group
module "modnsg" {
  depends_on = [ var.vnet ]
  source = "../nsg"
  nsg    = var.nsgroup
}

# creating vnet

module "modvnet" {
  depends_on = [ module.modrg ]
  source = "../vnet"
  vnet   = var.vnet
}
# creating sub


module "modsub" {
  depends_on = [ module.modvnet ]
  source = "../subnet"
  subnet = var.subnet
}

# creating pip

module "modvpip" {
  depends_on = [ module.modsub ]
  source = "../pip"
  pip    = var.pip
}

# creating nic

module "modnic" {
  depends_on = [ module.modvpip ]
  source = "../nic"
  nic    = var.nic
}
# creating vnet

module "modvm" {
   depends_on = [module.modnic ]

  source = "../vm"
  vm    = var.vmroot

}
