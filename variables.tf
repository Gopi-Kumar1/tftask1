variable "region" {
  description = "AWS region where all resources are created."
  type        = string
}

variable "name_prefix" {
  description = "Prefix used to build the names of all resources."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC."
  type        = string
}

variable "public_subnets" {
  description = "Map of public subnets. The key is the subnet suffix (a, b, c); the value holds its CIDR block and Availability Zone."
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "internet_cidr" {
  description = "Destination CIDR block for the route that sends internet-bound traffic to the Internet Gateway."
  type        = string
}