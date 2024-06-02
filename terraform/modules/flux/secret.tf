resource "kubernetes_secret" "git_credentials" {
  metadata {
    name      = "git-credentials"
    namespace = helm_release.flux.namespace
  }

  data = {
    "username" = var.git_username
    "password" = var.git_password
  }

  type = "kubernetes.io/basic-auth"
}
