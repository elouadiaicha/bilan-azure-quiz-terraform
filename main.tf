# ==========================================
# RESSOURCES AZURE EXISTANTES
# ==========================================

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azurerm_service_plan" "shared" {
  name                = var.app_service_plan_name
  resource_group_name = var.service_plan_resource_group_name
}

data "azurerm_client_config" "current" {}

# ==========================================
# BACKEND SPRING BOOT
# ==========================================

module "backend" {
  source = "./modules/app-service"

  app_name                  = var.backend_app_name
  location                  = data.azurerm_resource_group.main.location
  resource_group_name       = data.azurerm_resource_group.main.name
  service_plan_id           = data.azurerm_service_plan.shared.id
  java_version              = var.backend_java_version
  environment               = var.environment
  tags                      = var.tags
  virtual_network_subnet_id = module.network.backend_subnet_id
}
module "postgresql" {
  source = "./modules/postgresql"

  server_name         = var.postgresql_server_name
  database_name       = var.postgresql_database_name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  admin_username = var.postgresql_admin_username
  admin_password = var.postgresql_admin_password

  postgresql_version = var.postgresql_version
  sku_name           = var.postgresql_sku_name
  storage_mb         = var.postgresql_storage_mb

  tags = var.tags
}
module "storage" {
  source = "./modules/storage"

  storage_account_name = var.storage_account_name
  resource_group_name  = data.azurerm_resource_group.main.name
  location             = data.azurerm_resource_group.main.location

  storage_account_tier     = var.storage_account_tier
  storage_replication_type = var.storage_replication_type

  tags = var.tags
}
module "key_vault" {
  source = "./modules/key_vault"

  key_vault_name      = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  allowed_subnet_ids  = [module.network.backend_subnet_id]
  tags                = var.tags
}
module "redis" {
  source = "./modules/redis"

  redis_name          = var.redis_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.main.name

  sku_name = var.redis_sku_name
  family   = var.redis_family
  capacity = var.redis_capacity

  tags = var.tags
}
module "frontend" {
  source = "./modules/static-web-app"

  static_web_app_name = var.static_web_app_name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = var.location

  sku_tier = var.static_web_app_sku_tier
  sku_size = var.static_web_app_sku_size

  tags = var.tags
}
module "network" {
  source = "./modules/network"

  virtual_network_name    = var.virtual_network_name
  backend_subnet_name     = var.backend_subnet_name
  resource_group_name     = data.azurerm_resource_group.main.name
  location                = data.azurerm_resource_group.main.location
  address_space           = var.virtual_network_address_space
  backend_subnet_prefixes = var.backend_subnet_prefixes

  tags = var.tags
}
