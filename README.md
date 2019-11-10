# AWS ECS Container Definition module

This module renders a template representing a container definition. The rendered template can then be used by the
[ecs-task-definition](https://registry.terraform.io/modules/PGBI/ecs-task-definition/aws/) module.

## Usage

```hcl
/**
 * Initialize the project
 */
module "project" {
  source  = "PGBI/project/aws"
  version = "~>0.2.0"

  name     = "myproject"
  vcs_repo = "github.com/account/project"
}

/**
 * Generates a container definition
 */
module "container_definition" {
  source  = "PGBI/ecs-container-definition/aws"
  version = "~>0.2.0"
  
  project = module.project

  name           = "nginx"
  image          = "nginx:1.17"
  log_group_name = "a-log-group"
  env_vars = [
    {
      name  = "ENV"
      value = terraform.workspace
    }
  ]
  ports = [
    {
      containerPort = 80
      protocol      = "tcp"
    }
  ]
}

/**
 * Output the object representing the container definition.
 */
output "container_definition" {
  value = module.container_definition.definition
}
```
