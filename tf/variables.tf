variable "pub_sub_cidr" {
  description = "cidr of public subnet for databricks"
  default = {
    "Development" = "10.56.195.64/26",
    "Production"  = "10.56.142.0/25",
    "Staging"     = "10.56.193.192/28",
    "Test"        = "10.56.193.192/28",
  }
}

variable "pvt_sub_cidr" {
  description = "cidr of private subnet for databricks"
  default = {
    "Development" = "10.56.195.128/26",
    "Production"  = "10.56.142.128/25",
    "Staging"     = "10.56.193.208/28",
    "Test"        = "10.56.193.208/28",
  }
}

#######################
# Variables being assigned by ADO pipeline vars

variable "LOCATION" {
  description = "The resource group location/region, coming from ADO pipeline variables"
}

variable "VNT_RSG" {
  description = "The resource group name of the vnet from landing zone, coming from ADO pipeline variables"
}

variable "VNT_NAME" {
  description = "The name of the VNET from landing zone, coming from ADO pipeline variables"
}

variable "ENV" {
  description = "The name of the ENV from landing zone, coming from ADO pipeline variables"
}

variable "WORKLOAD_NAME" {
  description = "The name of the WORKLOAD from landing zone, coming from ADO pipeline variables"
}


##########################
// standard tags for tf azure deployments in SES, merge under locals with deployment specific tags
variable "tags" {
  description = "tags to be used for resources defined by CCoE"
  type        = map
  default     = {
    costcenter    = "2600088",
    customeremail = "Pedro.Pereira@ses.com",
    owner         = "Pedro Pereira",
    owneremail    = "Pedro.Pereira@ses.com",
    scope         = "ccoe-platform",
    tier          = "lz-network"
  }
}