# Main configuration file for Azure resources

subscription_id         = "c3c51b6f-a103-4383-968d-e66c0c79e7ed"
resource_group_name     = "watchlistswiss"
resource_group_location = "North Europe"
app_service_plan_name   = "watchlist-asp"
app_service_name        = "watchlistswiss18aa"
sql_server_name         = "watchlist-sql"
sql_database_name       = "watchlist-db"
sql_admin_login         = "4dm1n157r470r"
sql_admin_password      = "4-v3ry-53cr37-p455w0rd"
firewall_rule_name      = "watchlist-firewall"
repo_github_url         = "https://github.com/johnyloco/Watchlist"


# Secondary Variable File
os_type                = "Linux"
sku_name               = "F1"
sql_version            = "12.0"
sql_collation          = "SQL_Latin1_General_CP1_CI_AS"
sql_sku_name           = "S0"
zone_redundant         = false
start_ip_address       = "0.0.0.0"
end_ip_address         = "0.0.0.0"
dotnet_version         = "6.0"
always_on              = false
connection_string_name = "DefaultConnection"
connection_string_type = "SQLServer"
branch                 = "main"



# To apply the changes, run:
# -    terraform apply -var-file="values.tfvars"

# To destroy the resources, run:
# -    terraform destroy -var-file="values.tfvars"

#Empty comment just a test
