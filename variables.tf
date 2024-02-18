variable "location" {
  description = "The location/region where the container app will be created."
  type        = string
}

variable "subscription_id" {
  description = "The subscription id in which the container app will be created."
  type        = string
}

variable "environment_name" {
  description = "The name of the environment in which the container app will be created."
  type        = string
  validation {
    condition     = var.environment_name == "dev" || var.environment_name == "test" || var.environment_name == "prod"
    error_message = "The environment name must be either dev, test, or prod."
  }
}

variable "container_registery_name" {
  description = "The name of the container registry."
  type        = string
}
# container_app = {
#   name = "simpleapi"
#   containers = [
#     {
#       name                         = "frontapi"
#       external_connections_enabled = true
#       port_target                  = 3000
#       port_exposed                 = 443
#       container_name               = "frontapi"
#       container_image_url          = "mcr.microsoft.com/azuredocs/aci-helloworld"
#       container_cpu                = 0.25
#       container_ram                = 0.5
#       container_min_replicas       = 0
#       container_max_replicas       = 3
#       secrets = [
#         {
#           name  = "secret1"
#           value = "dududu"
#         }
#       ]
#     }
#   ]
# }

variable "container_app" {
  description = "The container apps to create."
  type = object({
    name = string
    containers = list(object({
      name                         = string
      external_connections_enabled = bool
      port_target                  = number
      # port_exposed                  = number
      container_name                = string
      container_registry_server     = string
      container_registry_repository = string
      container_cpu                 = number
      container_ram                 = string
      container_min_replicas        = number
      container_max_replicas        = number
      secrets = list(object({
        name  = string
        value = string
      }))
    }))
  })
}
