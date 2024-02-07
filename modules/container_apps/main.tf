# data "azurerm_resource_group" "this" {
#   name = var.resource_group_name
# }

# resource "azurerm_log_analytics_workspace" "this" {
#   name                = "law-${var.container_app_name}"
#   location            = data.azurerm_resource_group.this.location
#   resource_group_name = data.azurerm_resource_group.this.name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
# }

# resource "azurerm_container_app_environment" "this" {
#   name                       = "cae-${var.container_app_name}"
#   location                   = data.azurerm_resource_group.this.location
#   resource_group_name        = data.azurerm_resource_group.this.name
#   log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
# }

# resource "azurerm_container_app" "this" {
#   for_each                     = var.containers
#   name                         = each.value.name
#   container_app_environment_id = azurerm_container_app_environment.this.id
#   resource_group_name          = data.azurerm_resource_group.this.name
#   revision_mode                = "Single"

#   ingress {
#     allow_insecure_connections = false
#     external_enabled           = true #This is required to expose the container app to the internet
#     target_port                = 80
#     exposed_port               = 443
#     # transport                  = "HTTPS"
#     traffic_weight {
#       percentage      = 100
#       latest_revision = true
#     }

#   }

#   # identity {
#   #   type = "UserAssigned"
#   #   identity_ids = [
#   #     azurerm_user_assigned_identity.this.id, #TODO
#   #   ]
#   # }

#   template {
#     container {
#       name  = "examplecontainerapp"
#       image = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
#       cpu   = 0.25
#       # (Required) The amount of vCPU to allocate to the container. Possible values include 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, and 2.0.
#       memory = "0.5Gi"
#       # 0.5Gi, 1Gi, 1.5Gi, 2Gi, 2.5Gi, 3Gi, 3.5Gi and 4Gi.

#       readiness_probe {
#         transport = "HTTPS"
#         port      = 443 #port target
#       }

#       liveness_probe {
#         transport = "HTTPS"
#         port      = 443
#       }

#       startup_probe {
#         transport = "HTTPS"
#         port      = 443
#       }

#     }

#     max_replicas = 5
#     min_replicas = 0
#   }

#   secret {
#     name  = "example-secret"
#     value = 123
#   }

#   registry {
#     server               = "docker.io"
#     username             = "example"
#     password_secret_name = "example"
#   }
# }
