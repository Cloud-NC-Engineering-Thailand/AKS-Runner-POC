module "aks" {
  source = "../../module/aks"

  rg_config = {
    rg_name  = "test_aks"
    location = "East US"
  }

  vnet_config = {
    vnet_name     = "aks_vnet"
    address_space = ["10.0.0.0/16"]
  }

  snet_config = {
    snet_name        = "aks_snet"
    address_prefixes = ["10.0.0.0/24"]
  }

  aks_config = {
    aks_name          = "pimAKScluster"
    load_balancer_sku = "standard"
    identity = {
      type = "SystemAssigned"
    }
    tags = {
      environment = "Production"
    }
  }
}
