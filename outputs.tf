output "schemas_lookup_id" {
  description = "Map of id values across all schemas_lookup, keyed the same as var.schemas_lookup except keys with no id are omitted"
  value       = { for k, v in data.confluent_schemas.schemas_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "schemas_lookup_credentials" {
  description = "Map of credentials values across all schemas_lookup, keyed the same as var.schemas_lookup except keys with no credentials are omitted"
  value       = { for k, v in data.confluent_schemas.schemas_lookup : k => one(v.credentials) if v.credentials != null && length(v.credentials) > 0 }
  sensitive   = true
}
output "schemas_lookup_filter" {
  description = "Map of filter values across all schemas_lookup, keyed the same as var.schemas_lookup except keys with no filter are omitted"
  value       = { for k, v in data.confluent_schemas.schemas_lookup : k => one(v.filter) if v.filter != null && length(v.filter) > 0 }
}
output "schemas_lookup_rest_endpoint" {
  description = "Map of rest_endpoint values across all schemas_lookup, keyed the same as var.schemas_lookup except keys with no rest_endpoint are omitted"
  value       = { for k, v in data.confluent_schemas.schemas_lookup : k => v.rest_endpoint if v.rest_endpoint != null && length(v.rest_endpoint) > 0 }
}
output "schemas_lookup_schema_registry_cluster" {
  description = "Map of schema_registry_cluster values across all schemas_lookup, keyed the same as var.schemas_lookup except keys with no schema_registry_cluster are omitted"
  value       = { for k, v in data.confluent_schemas.schemas_lookup : k => one(v.schema_registry_cluster) if v.schema_registry_cluster != null && length(v.schema_registry_cluster) > 0 }
}
output "schemas_lookup_schemas" {
  description = "Map of schemas values across all schemas_lookup, keyed the same as var.schemas_lookup except keys with no schemas are omitted"
  value       = { for k, v in data.confluent_schemas.schemas_lookup : k => v.schemas if v.schemas != null && length(v.schemas) > 0 }
}

