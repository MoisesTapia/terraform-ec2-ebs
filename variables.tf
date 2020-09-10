variable "aws_region" {
    type    = string
    description = "Set the region where we'll deploy our infrastructure"
}

# Instances

variable "aws_ami" {
    type    = string
    description = ""
}

variable "aws_insta_type" {
    type    = string
    description = ""

}

variable "all_tags" {
    type    = list(string)
    description = ""
}

# Networking

variable "aws_networking" {
    type    = list(string)
    description = ""
}

variable "protocol_net" {
    type    = string
    description = ""
}


variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_classiclink" {
  description = "Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = false
}

# Security_group
variable "aws_public_sec_ingress" {
    type    = list(number)
    description = ""
}

variable "aws_public_sec_egress" {
    type    = list(number)
    description = ""
}