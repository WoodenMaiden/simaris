module "k0s" {
  source = "./modules/k0s"

  controllers = var.controllers
  workers     = var.workers
  both_roles  = var.both_roles
}

locals {
  kube_config = yamldecode(module.k0s.kubeconfig)
}

module "flux" {
  source = "./modules/flux"

  git_username = var.git_username
  git_password = var.git_password

  cluster_config_endpoint               = local.kube_config.clusters[0].cluster.server
  cluster_config_cluster_ca_certificate = base64decode(local.kube_config.clusters[0].cluster.certificate-authority-data)
  cluster_config_client_certificate     = base64decode(local.kube_config.users[0].user.client-certificate-data)
  cluster_config_client_key             = base64decode(local.kube_config.users[0].user.client-key-data)
}
