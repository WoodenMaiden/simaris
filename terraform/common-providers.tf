terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.13.2"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.30.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = module.k0s.kubernetes_config_path
  }
}

provider "kubernetes" {
  config_path = module.k0s.kubernetes_config_path 
}
