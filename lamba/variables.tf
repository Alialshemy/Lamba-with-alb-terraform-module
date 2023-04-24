variable "name" {
    type = string
}
variable "runtime" {
  type = string
  default = "nodejs16.x"
}
variable "lb_name" {
  type = string
}
variable "subnets" {
  type= list
}
variable "vpc_id" {
  type = string
}
variable "certificate_arn" {
  type = string
}
variable "role_name" {
  type = string
  
}
variable "sqs_name_policy" {
  type= string
}
variable "cloudwatch_name_policy" {
  type = string
}
variable "environment" {
  type= string
}