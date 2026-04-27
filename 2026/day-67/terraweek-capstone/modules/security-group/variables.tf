variable "vpc_id" {}
variable "ingress_ports" {
  type = list(number)
}
variable "environment" {}
variable "project_name" {}
variable "tags" {
  type = map(string)
}