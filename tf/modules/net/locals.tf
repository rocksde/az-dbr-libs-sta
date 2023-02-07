locals {
  subnet_types = tomap({
    for k, s in var.subnets : k => split("-", s.name)[4]
  })
  nsg_types = tomap({
    for k, s in var.nsg : split("-", s.name)[4] => k
  })
}

locals {
  subnet_nsgs = {
    for k, ty in local.subnet_types : k => try(local.nsg_types[ty], null)
  }
}