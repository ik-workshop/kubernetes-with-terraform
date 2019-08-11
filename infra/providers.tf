provider kubernetes {
  version          = "1.8.1"
  load_config_file = true
  config_path      = "${var.kub_config}"
}