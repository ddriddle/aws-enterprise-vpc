# Creates a NAT Gateway within an Enterprise VPC
#
# Copyright (c) 2017 Board of Trustees University of Illinois

terraform {
  required_version = ">= 0.8.7"
}

variable "tags" {
  description = "A mapping of tags to assign to the module's resource(s)"
  default     = {}
}

variable "public_subnet_id" {
  description = "Public-facing subnet in which to create this NAT gateway, e.g. subnet-abcd1234"
}

output "id" {
  value = "${aws_nat_gateway.nat.id}"
}

# Elastic IP for NAT Gateway

resource "aws_eip" "nat_eip" {
  vpc = true

  # TODO - Can we do better than this? What should the name be?
  tags = "{var.tags}"
}

# NAT Gateway

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${var.public_subnet_id}"

  # TODO - Can we do better than this? What should the name be?
  tags = "{var.tags}"
}
