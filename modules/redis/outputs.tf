output "hostname" {
  description = "Nom d'hôte Azure Managed Redis"
  value       = azurerm_managed_redis.redis.hostname
}

output "primary_access_key" {
  description = "Clé primaire Azure Managed Redis"
  value       = azurerm_managed_redis.redis.default_database[0].primary_access_key
  sensitive   = true
}

output "port" {
  description = "Port Azure Managed Redis"
  value       = azurerm_managed_redis.redis.default_database[0].port
}
