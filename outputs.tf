output "web_app_url" {
  value = azurerm_linux_web_app.alwa.default_hostname
}

output "web_app_ips" {
  value = azurerm_linux_web_app.alwa.outbound_ip_addresses
}

# az ad sp create-for-rbac --name "Azure-Terraform-GitHub-Actions-AleksP" --role Contributor --scopes /subscriptions/c3c51b6f-a103-4383-968d-e66c0c79e7ed --sdk-auth
