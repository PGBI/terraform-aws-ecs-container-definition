output "definition" {
  description = "Object representing the container definition."
  value = {
    environment: var.env_vars,
  essential: var.essential,
  image             = var.image
  logConfiguration = {
    logDriver = "awslogs",
    options = {
      "awslogs-group": var.log_group_name,
      "awslogs-stream-prefix": var.name,
      "awslogs-region": var.project.region
    }
  }
  name = var.name,
  portMappings = var.port_mappings
}
}
