module "resource_group" {
  source = "../../modules/resource_group"
  rgs    = var.rgs_root
}

module "network" {
  depends_on = [ module.resource_group ]
  source   = "../../modules/networking"
  networks = var.network_root
}

/*
module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/key_vault"
  kvs        = var.kvs_root
}
*/

module "public_ip" {
  depends_on = [ module.network ]
  source = "../../modules/public_ip"
  public_ips = var.public_ips_root
}


module "compute" {
  depends_on = [ module.public_ip ]
  source = "../../modules/compute"
  vms = var.vms_root
}
