output "static_web_app_id" {
  description = "Identifiant de l'Azure Static Web App"
  value       = module.frontend.id
}

output "static_web_app_default_host_name" {
  description = "Nom d'hôte du frontend Angular"
  value       = module.frontend.default_host_name
}

output "static_web_app_api_key" {
  description = "Clé de déploiement de l'Azure Static Web App"
  value       = module.frontend.api_key
  sensitive   = true
}
