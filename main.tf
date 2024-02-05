resource "azurerm_resource_group" "this" {
  name     = "dudududud"
  location = var.location
}

module "container_app" {
  source                         = "./modules/container_apps"
  resource_group_name            = "ddududud"
  container_app_environment_name = "example-environment"

  depends_on = [azurerm_resource_group.this]
}
