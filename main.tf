terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.1.0"
    }
  }
}

# Provider configuration with Subscription ID

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Generate a random integer for unique naming

# For development purposes only, not recommended for production
# Remove also {random_integer.ri.result} from resource names in production
# And leave just the variable names like " var.resource_group_name "

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

#Create a resource group
resource "azurerm_resource_group" "arg" {
  name     = "${var.resource_group_name}${random_integer.ri.result}"
  location = var.resource_group_location
}

# Create App Service Plan name
resource "azurerm_service_plan" "asp" {
  name                = "${var.app_service_plan_name}${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.arg.name
  location            = azurerm_resource_group.arg.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

# Create MSSQL Server
resource "azurerm_mssql_server" "server" {
  name                         = "${var.sql_server_name}${random_integer.ri.result}"
  resource_group_name          = azurerm_resource_group.arg.name
  location                     = azurerm_resource_group.arg.location
  version                      = var.sql_version
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password
}

# Create MSSQL Database
resource "azurerm_mssql_database" "database" {
  name           = var.sql_database_name
  server_id      = azurerm_mssql_server.server.id
  collation      = var.sql_collation
  license_type   = "LicenseIncluded"
  sku_name       = var.sql_sku_name
  zone_redundant = var.zone_redundant
}

# Allow public access to the MSSQL Server
resource "azurerm_mssql_firewall_rule" "firewall" {
  name             = var.firewall_rule_name
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}

# Create Linux Web App
# This web app will be used to host the application without taking Random Integer for unique naming
resource "azurerm_linux_web_app" "alwa" {
  name                = "${var.app_service_name}${random_integer.ri.result}"
  location            = azurerm_resource_group.arg.location
  resource_group_name = azurerm_resource_group.arg.name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      dotnet_version = var.dotnet_version
    }

    always_on = var.always_on
  }

  connection_string {
    name  = var.connection_string_name
    type  = var.connection_string_type
    value = "Data Source=tcp:${azurerm_mssql_server.server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.database.name};User ID=${azurerm_mssql_server.server.administrator_login};Password=${azurerm_mssql_server.server.administrator_login_password} ;Trusted_Connection=False;MultipleActiveResultSets=True;"
  }
}

# Configure GitHub Deployment
resource "azurerm_app_service_source_control" "apssc" {
  app_id   = azurerm_linux_web_app.alwa.id
  repo_url = var.repo_github_url
  branch   = var.branch

  use_manual_integration = true
}
