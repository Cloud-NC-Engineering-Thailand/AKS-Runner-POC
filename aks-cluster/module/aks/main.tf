resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_config.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.aks_config.aks_name}-dns"

  default_node_pool {
    name       = "default"
    vm_size    = "Standard_D2_v2"
    node_count = 3

  }
  network_profile {
    network_plugin     = "azure"
    service_cidr       = azurerm_subnet.snet.address_prefixes[0]
    dns_service_ip     = "10.0.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    load_balancer_sku  = var.aks_config.load_balancer_sku
  }

  identity {
    type = var.aks_config.identity.type
  }

  tags = {
    Environment = var.aks_config.tags.environment
  }
}



