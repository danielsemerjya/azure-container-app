locals {
  container_registery_name = "crgivemeart0${var.environment_name}"
  resource_group_name      = "rg-${var.container_app.name}-${var.environment_name}"
}

resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = var.location
}

data "azurerm_container_registry" "this" {
  name                = var.container_registery_name
  resource_group_name = "container-registery"
}

resource "azurerm_user_assigned_identity" "this" {
  name                = "uai-${local.container_app_full_name}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
}

resource "azurerm_role_assignment" "this" {
  scope                = data.azurerm_container_registry.this.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}

module "container_app" {
  provider            = azurerm
  source              = "git::github.com/danielsemerjya/azure-container-app.git"
  resource_group_name = azurerm_resource_group.this.name
  container_app_name  = local.container_app_full_name
  identity_ids        = [azurerm_user_assigned_identity.this.id]

  containers = var.container_app.containers
}
