variable "region" {
  type        = string
  description = "the aws region"
}

variable "environment" {
  type        = string
  description = "deployment environment"
}

variable "private_subnet_a" {
  type      = string
}

variable "private_subnet_b" {
  type      = string
}

variable "public_subnet_a" {
  type      = string
}

variable "public_subnet_b" {
  type      = string
}

variable "ssh_security_group" {
  type      = list
}

variable "web_security_group" {
  type      = list
}

variable "app" {
  type      = string
}
