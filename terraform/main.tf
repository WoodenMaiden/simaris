module "k0s" {
  source = "./modules/k0s"

  controllers = var.controllers
  workers = var.workers
  both_roles = var.both_roles
}

module "flux" {
  source = "./modules/flux"

  git_username = var.git_username
  git_password = var.git_password
}
