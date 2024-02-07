locals {
  container_registery_name = "crgivemeart0${var.environment_name}"
  resource_group_name      = "rg-${var.container_app.name}-${var.environment_name}"
  container_app_full_name  = "${var.container_app.name}-${var.environment_name}"
}

resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = var.location
}

data "azurerm_container_registry" "this" {
  name                = local.container_registery_name
  resource_group_name = "container-registery"
}

module "container_app" {
  source              = "./modules/container_apps"
  resource_group_name = "ddududud"
  container_app_name  = local.container_app_full_name

  containers = var.container_app.containers

  depends_on = [azurerm_resource_group.this]
}


output "containers" {
  description = "The id of the container app."
  value       = module.container_app.containers
}
