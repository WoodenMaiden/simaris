resource "kubernetes_namespace" "flux" {
  metadata {
    name = "flux-system"
    annotations = {
      createdBy = "terraform"
    }
  }
}
