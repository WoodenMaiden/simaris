output "kubeconfig" {
  value = k0s_cluster.simaris-santuary.kubeconfig
}

resource "local_file" "kubeconfig" {
  content = k0s_cluster.simaris-santuary.kubeconfig
  filename = "${path.root}/kubeconfig"
}
