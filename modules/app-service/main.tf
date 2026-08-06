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
  }

  tags = var.tags
}
