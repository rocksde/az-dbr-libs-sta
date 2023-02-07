module "rsg" {
  for_each = toset( [local.rsg_gen] )
  source   = "./modules/rsg"
  name     = each.key
  location = var.LOCATION
  tags     = local.tags
}

# module "net" {
#   resource_group_name = var.VNT_RSG
#   source    = "./modules/net"
#   vnet_name = var.VNT_NAME
#   location  = var.LOCATION
#   tags      = local.tags
#   subnets   = local.subnets
#   nsg       = local.nsg
#   udr       = local.udr
# }

module "acr" {
  source   = "./modules/acr"
  name     = local.reg040
  location = var.LOCATION
  rsg_name = module.rsg.rsg_name
  tags     = local.tags
}

# module "aci" {


#   depends_on = [
#     module.rsg,
#   ]
# }
