variable "AZCount" {
  description = "How many AZs to deploy to."
  type        = number
  default     = 2
}

variable "createNATGateways" {
  description = "Should we create NAT Gateways for the private subnets."
  type        = bool
  default     = false
}

variable "environmentName" {
  description = "Project Name - used to generate name labels."
  type        = string
  default     = "JenkinsECS"
}

variable "publicSubnetCidrs" {
  description = "list of cidrs for public subnets."
  type        = list
  default = [
    "10.0.0.0/24",
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
  ]
}

variable "privateSubnetCidrs" {
  description = "list of cidrs for public subnets."
  type        = list
  default = [
    "10.0.10.0/24",
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24"
  ]
}

variable "region" {
  description = "AWS Region for deployment."
  type        = string
  default     = "us-east-1"
}


variable "vpcCidr" {
  description = "CIDR Range for VPC."
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition     = can(regex("^(([0-9]{1,3}).){3}[0-9]{1,3}/[0-9]{1,2}$", var.vpcCidr))
    error_message = "Please specify a valid VPC CIDR range."
  }
}


