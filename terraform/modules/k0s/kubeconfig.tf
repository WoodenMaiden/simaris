resource "local_file" "kubeconfig" {
  content  = k0s_cluster.simaris-santuary.kubeconfig
  filename = "${path.module}/output/kubeconfig.yaml"
}