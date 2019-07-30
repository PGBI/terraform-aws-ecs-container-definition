output "json" {
  description = "The rendered container definition string."
  value = templatefile("${path.module}/definition.json.tplm", {
    env_vars          = jsonencode(var.env_vars)
    essential         = var.essential
    image             = var.image
    name              = var.name
    port_mappings     = jsonencode(var.port_mappings)
    log_group_name    = var.log_group_name
    log_stream_prefix = var.name
    region            = var.project.region
  })
}
