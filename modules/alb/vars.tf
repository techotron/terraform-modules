variable "environment" {
    type        = string
    description = "deployment environment"
}

variable "app" {
    type        = string
}

variable "region" {
    type        = string
    description = "the aws region"
}

variable "lb_targetgroup_type" {
    type        = string
    description = "target group type [ instance | ip ]"
    default     = "ip"
}