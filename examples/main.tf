/**
 * Configure the AWS Provider
 */
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

/**
 * Initialize the project
 */
module "project" {
  source  = "PGBI/project/aws"
  version = "~>0.1.0"

  name     = "myproject"
  vcs_repo = "github.com/account/project"
}

/**
 * Generates a container definition
 */
module "container_definition" {
  source  = "PGBI/ecs-container-definition/aws"
  version = "~>0.1.0"

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
  port_mappings = [
    {
      containerPort = 80
      hostPort      = 8080
    }
  ]
}

/**
 * Output the json document representing the container definition.
 */
output "container_definition_json" {
  value = module.container_definition.json
}
