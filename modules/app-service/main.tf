resource "azurerm_linux_web_app" "backend" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  https_only = true

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = true

    application_stack {
      java_version        = var.java_version
      java_server         = "JAVA"
      java_server_version = var.java_version
    }
  }

  app_settings = {
    ENVIRONMENT                         = var.environment
    WEBSITES_PORT                       = "8080"
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"

    SPRING_PROFILES_ACTIVE = "prod"

    SPRING_DATASOURCE_URL      = var.postgresql_url
    SPRING_DATASOURCE_USERNAME = var.postgresql_username
    SPRING_DATASOURCE_PASSWORD = var.postgresql_password

    REDIS_HOSTNAME    = var.redis_hostname
    REDIS_PORT        = var.redis_port
    REDIS_PASSWORD    = var.redis_password
    REDIS_SSL_ENABLED = "true"

    STORAGE_ACCOUNT_NAME   = var.storage_account_name
    STORAGE_CONTAINER_NAME = var.storage_container_name

    BACKEND_API_KEY = var.backend_api_key

    APP_CORS_ALLOWED_ORIGINS = var.frontend_origin
  }

  tags = var.tags
}
