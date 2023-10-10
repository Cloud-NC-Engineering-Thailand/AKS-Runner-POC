variable "rg_config" {
  description = "Configuration for the resource group"
  type = object({
    rg_name  = string
    location = string
  })
}

variable "vnet_config" {
  description = "Configuration for the virtual network"
  type = object({
    vnet_name     = string
    address_space = list(string)
  })
}

variable "snet_config" {
  description = "Configuration for the subnet"
  type = object({
    snet_name        = string
    address_prefixes = list(string)
  })
}

variable "aks_config" {
  description = "Configuration for the AKS cluster"
  type = object({
    aks_name          = string
    load_balancer_sku = string
    identity = object({
      type = string
    })
    tags = object({
      environment = string
    })
  })
}


