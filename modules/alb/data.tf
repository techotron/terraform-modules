data "aws_vpc" "vpc" {
  tags = {
    Name = "${var.app}_vpc"
  }
}

data "aws_subnet_ids" "subnet_ids" {
  vpc_id = data.aws_vpc.vpc.id
  tags = {
    "subnet_type"     = "public"
    "environment"     = var.environment
  }
}

data "aws_subnet" "subnets" {
  for_each = data.aws_subnet_ids.subnet_ids.ids
  id       = each.value
}

data "aws_security_group" "external_http_sg" {
  tags = {
    "Name"          = "${var.app}_public_allow"
    "app"           = var.app
    "environment"   = var.environment
  }
}

data "aws_security_group" "internal_allow_sg" {
  tags = {
    "Name"          = "${var.app}_internal_allow"
    "app"           = var.app
    "environment"   = var.environment
  }
}
