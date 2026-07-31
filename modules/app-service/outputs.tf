output "id" {
  description = "Identifiant de l'Azure Linux Web App"
  value       = azurerm_linux_web_app.backend.id
}

output "name" {
  description = "Nom de l'Azure Linux Web App"
  value       = azurerm_linux_web_app.backend.name
}

output "default_hostname" {
  description = "Nom de domaine généré pour le backend"
  value       = azurerm_linux_web_app.backend.default_hostname
}

output "principal_id" {
  description = "Identifiant de l'identité managée du backend"
  value       = azurerm_linux_web_app.backend.identity[0].principal_id
}
