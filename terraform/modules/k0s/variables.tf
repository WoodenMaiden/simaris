variable "workers" {
  type = set(string)
  default = []
  description = "List of IPS to worker nodes to create"
}

variable "controllers" {
  type = set(string)
  default = []
  description = "List of IPS to controller nodes to create"
}

variable "both_roles" {
  type = set(string)
  default = []
  description = "List of IPS to nodes that will be both worker and controller"
}
