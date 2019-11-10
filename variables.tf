variable "project" {
  description = "Reference to a \"project\" module. See: https://registry.terraform.io/modules/PGBI/project/aws/"
}

variable "env_vars" {
  type        = list(object({ name = string, value = string }))
  default     = []
  description = "Environment variables to pass to the container on startup."
}

variable "essential" {
  default     = true
  description = "If true and that container fails or stops for any reason, all other containers that are part of the task are stopped."
}

variable "image" {
  type        = "string"
  description = "The image used to start a container. This string is passed directly to the Docker daemon. Images in the Docker Hub registry are available by default. Other repositories are specified with either repository-url/image:tag or repository-url/image@digest."
}

variable "name" {
  type        = "string"
  description = "Name of the container."
}

variable "ports" {
  default     = []
  type        = list(object({ containerPort = number, protocol = string }))
  description = "List of ports exposed by the container with their protocol."
}

variable "log_group_name" {
  type        = "string"
  description = "Name of the log group the docker container will ship its logs to. Log will be shipped to a log stream whose name will be prefixed with the container name."
}
