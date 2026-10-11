data "confluent_schemas" "schemas_lookup" {
  for_each = var.schemas_lookup

  rest_endpoint = each.value.rest_endpoint

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      key    = credentials.value.key
      secret = credentials.value.secret
    }
  }

  dynamic "filter" {
    for_each = each.value.filter != null ? [each.value.filter] : []
    content {
      deleted        = filter.value.deleted
      latest_only    = filter.value.latest_only
      subject_prefix = filter.value.subject_prefix
    }
  }

  dynamic "schema_registry_cluster" {
    for_each = each.value.schema_registry_cluster != null ? [each.value.schema_registry_cluster] : []
    content {
      id = schema_registry_cluster.value.id
    }
  }
}

