variable kube_config {}
variable apps {
  type = map
}

variable helm_repositories {
  type = map
  default = {
    "stable"    = "https://kubernetes-charts.storage.googleapis.com"
    "incubator" = "https://kubernetes-charts-incubator.storage.googleapis.com/"
  }
}
