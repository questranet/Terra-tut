module "test" {
  source = "./local-module"
  input = var.input
}

variable "input" {
  dafault = "Hello Universe"
}