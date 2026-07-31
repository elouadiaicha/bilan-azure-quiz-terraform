resource "azurerm_postgresql_flexible_server" "postgres" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location

  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  version    = var.postgresql_version
  sku_name   = var.sku_name
  storage_mb = var.storage_mb

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  tags = var.tags
}

resource "azurerm_postgresql_flexible_server_database" "database" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.postgres.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
