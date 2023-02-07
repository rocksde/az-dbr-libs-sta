variable resource_group_name {
  description = "Resource group where resource will be deployed"
  type        = string
}

variable vnet_name {
  description = "VNET name"
  type        = string
}

variable udr {
  type        = string
}

variable tags {
  type = map
}

variable "location" {
  description = "Location where resource is to be created"
  
}

variable "subnets" {
  description = "A map to create multiple subnets"
  type = map(object({
    name = string
    address_space = list(string)
    subnet_delegation = string
  })) 
}

variable "nsg" {
  description = "A map of NSGs"
  type = map(object({
    name = string
  }))
  
}