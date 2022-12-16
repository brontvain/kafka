terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.0.16"
    }
  }
}

provider "kind" {}

resource "kind_cluster" "default" {
  name = "kafka"
  wait_for_ready = true
  kind_config {
    kind = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }

    node {
      role = "worker"
      image = "kindest/node:v1.23.4"
    }
  }
}