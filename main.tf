resource "null_resource" "install_ibmcloud_cli" {
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command = "${path.module}/scripts/install-ibmcloud-cli.sh"
  }
}

