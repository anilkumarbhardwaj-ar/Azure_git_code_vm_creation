rgname = {
    rg1 = {

    name = "rg-admin"
    location = "central India"
    }
}
# Adding the value in the Network Security Group (
nsg = {

    nsgrule = {
name = "nsg-admin"
security_rule ={
    priority = "100"
    source_port_range = "22"
}
    }

 nsgrule1 = {
name = "nsg-admin"
security_rule = {
    priority = "101"
    source_port_range = "80"
}
    }
}
# Adding the value in the Virtual Network  (Two Virtual Network Creation)

vnet = {
    vnet1 = {
        name = "vnet-admin1"
        address_space       = ["10.0.0.0/16"]
        
    }

}
# Addting the value in the Subnet (Two Subnet creation)

subnet = {
    sub1 = {
        name = "frontend-subnet"
        address_prefixes     = ["10.0.1.0/24"]
        vname = "vnet-admin1"
}

sub2 = {
        name = "backend-subnet"
        address_prefixes     = ["10.0.2.0/24"]
        vname = "vnet-admin1"
}
sub3 = {
    name = "AzureBastionSubnet"
    address_prefixes = ["10.0.3.0/24"]
    vname = "vnet-admin1"

}

}
# Addting the value in the Network Interface (NIC) (Two NIC creation)

nic = {
    nic1 = {
        name = "frontend-nic"
        address_space = ["10.0.1.0/24"]
        sname = "frontend-subnet"
    }

     nic2 = {
        name = "backend-nic"
        address_space = ["10.0.2.0/24"]
        sname = "backend-subnet"
    }
}
# Addting the value in the vm (Two VM creation)

vm = {
    vm1 = {
        name = "frontend-vm-admin"
        vname = "frontend-nic"
        keyname = "username"
    }

    vm2 = {
        name = "backend-vm"
        vname = "backend-nic"
        keyname = "username"
    }
}


# Addting the value in the vm (Two PIP creation)

pip = {

    pip1 = {
        name = "bastion-pip"
    }

    pip2 = {
        name = "Load_balancer-pip"
    }
}

# Addting the value in the vm bastion

bas = {
    bas1 = {
        name = "bastion_host"
        sname = "AzureBastionSubnet"
        pipname = "bastion-pip"
    }
}

# Addting the value in the Key Vault

key = {
    key1 = {
        name = "username"
        vname = "adminuser"
    }
    
 key2 = {
        name = "password"
        vname = "Admin@12345!"
    }
}
