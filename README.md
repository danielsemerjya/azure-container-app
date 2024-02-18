# azure-container-app
Module to use Container App



1. To internal communicate between container apps use url:

https://<APP_NAME>.internal.<APP_ENVIRONMENT_NAME>.<REGION>.azurecontainersapp.io

2. How to run project

2.1 Setup dev.tfvars file like in example.
2.2 Type "terraform init"
2.3 Type "terraform plan --var-file=dev.tfvars"
2.4 Type "terraform apply --var-file=dev.tfvars"