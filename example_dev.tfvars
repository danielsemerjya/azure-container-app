subscription_id          = "12312312312312312312312"
location                 = "Sweden Central"
container_registery_name = "crgivemeart0dev"

environment_name = "dev"

container_app = {
  name = "simpleapi"
  containers = [
    {
      name                          = "frontapi"
      external_connections_enabled  = true
      port_target                   = 3000
      container_name                = "generator"
      container_registry_server     = "crgivemeart0dev.azurecr.io"
      container_registry_repository = "sample/simple-api:v0.2"
      container_cpu                 = 0.25
      container_ram                 = 0.5
      container_min_replicas        = 0
      container_max_replicas        = 3
      secrets = [
        {
          name  = "openaiapikey"
          value = "sk-f76ERlaXejmg9EIl"
        },
        {
          name  = "apikey"
          value = "AS*DN!!SASD*NYA*&JSDAS&DT^A*231"
        }
      ]
    }
  ]
}
