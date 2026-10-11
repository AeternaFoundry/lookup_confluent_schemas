variable "schemas_lookup" {
  description = <<EOT
Map of schemas_lookup, attributes below
Optional:
    - rest_endpoint
    - credentials (block):
        - key (required)
        - secret (required)
    - filter (block):
        - deleted (optional)
        - latest_only (optional)
        - subject_prefix (optional)
    - schema_registry_cluster (block):
        - id (required)
EOT

  type = map(object({
    rest_endpoint = optional(string)
    credentials = optional(object({
      key    = string
      secret = string
    }))
    filter = optional(object({
      deleted        = optional(bool)
      latest_only    = optional(bool)
      subject_prefix = optional(string)
    }))
    schema_registry_cluster = optional(object({
      id = string
    }))
  }))
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

