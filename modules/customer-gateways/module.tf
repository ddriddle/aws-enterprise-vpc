# Creates Customer Gateways in your AWS account corresponding to the VPN
# terminators provided by Technology Services
#
# Copyright (c) 2017 Board of Trustees University of Illinois

terraform {
  required_version = ">= 0.9.1"
}

variable "tags" {
  description = "A mapping of tags to assign to the module's resource(s)"
  default     = {}
}

output "customer_gateway_ids" {
  value = {
    vpnhub-aws1-pub = "${aws_customer_gateway.vpnhub-aws1-pub.id}"
    vpnhub-aws2-pub = "${aws_customer_gateway.vpnhub-aws2-pub.id}"
  }
}

resource "aws_customer_gateway" "vpnhub-aws1-pub" {
  tags = "${merge(map("Name", "vpnhub-aws1-pub"), var.tags)}"

  ip_address = "128.174.0.21"
  bgp_asn    = 65044
  type       = "ipsec.1"
}

resource "aws_customer_gateway" "vpnhub-aws2-pub" {
  tags = "${merge(map("Name", "vpnhub-aws2-pub"), var.tags)}"

  ip_address = "128.174.0.22"
  bgp_asn    = 65044
  type       = "ipsec.1"
}
