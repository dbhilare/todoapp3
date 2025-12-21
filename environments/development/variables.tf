variable "rgs_root" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
    }
  ))
}

variable "network_root" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })))
  }))
}

/*
variable "kvs_root" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    tenant_id                  = string
    sku_name                   = string
    soft_delete_retention_days = number
    purge_protection_enabled   = bool
    tags                       = optional(map(string))
    key_permissions            = list(string)
    secret_permissions         = list(string)
    storage_permissions        = list(string)
  }))
}
*/

variable "public_ips_root" {}


variable "vms_root" {
  type = map(object(
    {
      vm_name                = string
      kv_name                = string
      # admin_username         = string
      # admin_password         = string
      rg_name                = string
      location               = string
      nic_name               = string
      pip_name               = string
      vnet_name              = string
      subnet_name            = string
      size                   = string
      source_image_reference = map(string)
    }
  ))
}
