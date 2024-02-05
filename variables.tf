variable "location" {
  description = "The location/region where the container app will be created."
  type        = string
}

variable "resource_group_names" {
  description = "The name of the resource group in which the container app will be created."
  type        = list(string)
}

variable "subscription_id" {
  description = "The subscription id in which the container app will be created."
  type        = string
}

variable "docker_credentials" {
  description = "The docker credentials to use for the container app."
  type = object({
    username = string
    password = string
  })
}

variable "container_apps" {
  description = "The container apps to create."
  type = list(object({
    name                = string
    resource_group_name = string
    containers = list(object({
      name                         = string
      external_connections_enabled = bool
      port_target                  = number
      port_exposed                 = number
      container_name               = string
      container_image_url          = string
      container_cpu                = number
      container_ram                = string
      container_min_replicas       = number
      container_max_replicas       = number
      secrets = list(object({
        name  = string
        value = string
      }))
    }))
  }))
}
