resource "null_resource" "null" {
  count = 5
  provisioner "local-exec" {
    command = "echo Index no - ${count.index}"
  }
}

