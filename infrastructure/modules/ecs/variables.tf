variable "image_url" {}
variable "subnet_id" {}
variable "vpc_id" {
  type = string
}
variable "alb_security_group_id" {
  type = string
}
variable "target_group_arn" {
  type = string
}
variable "security_group_id" {
  type = string
}