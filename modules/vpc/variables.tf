variable "cidr" {
  description = "The CIDR block for the VPC."
  default = "10.40.0.0/16"
}

variable "external_subnets" {
  description = "List of external subnets"
  type        = list(string)
  default = [""]
}

variable "internal_subnets" {
  description = "List of internal subnets"
  type        = list(string)
  default = [""]
}

variable "environment" {
  description = "Environment tag, e.g prod"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = [""]
}

variable "name" {
  description = "Name tag, e.g stack"
  default     = "stack"
}

variable billing { }

variable "component" { default = "vpc"}
