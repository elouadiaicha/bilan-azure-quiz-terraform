output "id" {
  description = "Identifiant de l'Azure Static Web App"
  value       = azurerm_static_web_app.frontend.id
}

output "default_host_name" {
  description = "Nom d'hôte du frontend Angular"
  value       = azurerm_static_web_app.frontend.default_host_name
}

output "api_key" {
  description = "Clé de déploiement de l'Azure Static Web App"
  value       = azurerm_static_web_app.frontend.api_key
  sensitive   = true
}
