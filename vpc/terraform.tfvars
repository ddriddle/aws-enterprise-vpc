# This file supplies values for the variables defined in main.tf
#
# Copyright (c) 2017 Board of Trustees University of Illinois

# AWS region (must be us-east-2 for an Enterprise VPC)
region = "us-east-2"

# Your 12-digit AWS account number
account_id = "999999999999" #FIXME

# The short name of your VPC, e.g. "foobar1" if the full name is "aws-foobar1-vpc"
vpc_short_name = "example" #FIXME

# Add VPC Peering Connection IDs here *after* the peering is created
#pcx_ids = ["pcx-abcd1234"]

# IPv4 addresses of Core Services Resolvers in your peer Core Services VPC
#core_services_resolvers = ["10.224.1.50", "10.224.1.100"]

