rgs_root = {
  rg1 = {
    name       = "dev-rg1"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      env = "development"
    }
  }
}

network_root = {
  vnet1 = {
    name                = "vnet-todoapp"
    location            = "centralindia"
    resource_group_name = "dev-rg1"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

/*
kvs_root = {
  k1 = {
    name                       = "kv-dev-todoapp-420"
    location                   = "centralindia"
    resource_group_name        = "tfstate-rg"
    tenant_id                  = "0f2bed73-73bb-49c5-8d7a-598e13736910"
    sku_name                   = "standard"
    soft_delete_retention_days = 7
    purge_protection_enabled   = false
    tags = {
      environment = "dev"
      project     = "todo-app"
    }
    key_permissions     = ["Get"]
    secret_permissions  = ["Get"]
    storage_permissions = ["Get"]
  }
}
*/

public_ips_root = {
  fevmip = {
    name                = "fevmipdns-dev01"
    resource_group_name = "dev-rg1"
    location            = "centralindia"
    allocation_method   = "Static"
    zones               = ["1", "2"]
    domain_name_label   = "fevmip-dns"
    tags = {
      app = "frontend"
      env = "dev"
    }
  }

  bevmip = {
    name                = "pip-be"
    resource_group_name = "dev-rg1"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
    ip_version          = "IPv4"
    tags = {
      app = "backend"
      env = "staging"
    }
  }
}

vms_root = {
  vm1 = {
    nic_name    = "nic-fe-vm01"
    location    = "centralindia"
    rg_name     = "dev-rg1"
    vnet_name   = "vnet-todoapp"
    subnet_name = "frontend-subnet"
    pip_name    = "fevmipdns-dev01"
    vm_name     = "frontend-vm"
    size        = "Standard_F2"
    kv_name     = "kv-dev-todoapp-420"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
