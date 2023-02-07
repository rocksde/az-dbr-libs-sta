locals {
reg040 = replace("reg${local.name_conv}040","-","")
##############################################################################
# resources being actively created through this script
    rsg_gen = "rsg-${local.name_conv}-040"

    subnets = {
        subnet1 = {
            name = "snt-${local.name_conv}-040"
            address_space =  [var.pub_sub_cidr[var.ENV]]
            subnet_delegation = true
        }

        subnet2 = {
            name = "snt-${local.name_conv}-040"
            address_space = [var.pvt_sub_cidr[var.ENV]]
            subnet_delegation = true
        }
    }

    nsg = {
        public_nsg = {
            name = "nsg-${local.name_conv}-040"
        }
    }

# creation will be done by dbr deployment directly, only providing name to 
# avoid random RSG name

##############################################################################
# resources being used but not created by this script
    rsg = "rsg-${local.name_conv}-022"
    kvt = "kvt-${local.name_conv}-002"
    udr = "udr-${local.name_conv}-001"
    snt = "snt-${local.name_conv}-001"
    sta = replace("sta-${local.name_conv}-002","-","")

    dbr001 = "dbr-${local.name_conv}-001"

##############################################################################
# naming convention enforcement, no modification needed usually, uses
    
    tags = merge(
        var.tags,
        {
            env      = var.ENV
            workload = var.WORKLOAD_NAME
        },
    )

    env_char = {
        "Development" = "d",
        "Production"  = "p",
        "Staging"     = "t",
        "Test"        = "t",
    }

    loc_char = {
        "westeurope" = "weu1",
    }

    env_char_out = local.env_char[var.ENV]
    loc_char_out = local.loc_char[var.LOCATION]

    env_short = local.env_char_out
    workload  = lower(var.WORKLOAD_NAME)
    name_conv = "${local.workload}-${local.loc_char_out}-${local.env_char_out}"
    name_cosh = "${local.loc_char_out}-${local.env_char_out }"
}
