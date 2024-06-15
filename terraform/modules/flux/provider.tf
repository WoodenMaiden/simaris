terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.13.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.30.0"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = var.cluster_config_endpoint
    client_certificate     = var.cluster_config_client_certificate
    client_key             = var.cluster_config_client_key
    cluster_ca_certificate = var.cluster_config_cluster_ca_certificate
  }
}

provider "kubernetes" {
  host                   = var.cluster_config_endpoint
  client_certificate     = var.cluster_config_client_certificate
  client_key             = var.cluster_config_client_key
  cluster_ca_certificate = var.cluster_config_cluster_ca_certificate
}
