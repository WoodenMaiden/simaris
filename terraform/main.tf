module "k0s" {
  source = "./modules/k0s"

  controllers = var.controllers
  workers = var.workers
  both_roles = var.both_roles
}
