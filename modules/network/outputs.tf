output "virtual_network_id" {
  description = "Identifiant du réseau virtuel"
  value       = azurerm_virtual_network.main.id
}

output "backend_subnet_id" {
  description = "Identifiant du subnet backend"
  value       = azurerm_subnet.backend.id
}
