resource "k0s_cluster" "simaris-santuary" {
  name = "simaris-santuary"

  version = "v1.30.1+k0s.0"

  hosts = [for i, v in concat(local.controllers, local.workers, local.both_roles) : {
    role = i < length(local.controllers) ? "controller" : (
      i < length(local.controllers) + length(local.workers) ? "worker" : "controller+worker"
    )

    ssh = {
      address  = v
      port     = 22
      user     = "yann"
      key_path = pathexpand("~/.ssh/id_ed25519")
    }
  }]

}

locals {
  // a set is not an array and thus doesn't have an index
  controllers = tolist(var.controllers)
  workers     = tolist(var.workers)
  both_roles  = tolist(var.both_roles)
}

