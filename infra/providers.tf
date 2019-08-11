terraform {
  # The modules used in this example have been updated with 0.12 syntax, which means the example is no longer
  # compatible with any versions below 0.12.
  required_version = ">= 0.12"
}

provider kubernetes {
  version          = "1.8.1"
  load_config_file = true
  config_path      = var.kube_config
}

provider helm {
  version        = ">= 0.10.1"
  install_tiller = true

  kubernetes {
    config_path = var.kube_config
  }
}
