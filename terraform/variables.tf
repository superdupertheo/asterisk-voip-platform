variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource tags"
  type        = string
  default     = "asterisk-voip-platform"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "ami_id" {
  description = "Rocky Linux AMI ID for the selected region"
  type        = string
}

variable "key_name" {
  description = "Existing AWS EC2 key pair"
  type        = string
}

variable "admin_cidr" {
  description = "Public IP range allowed to use SSH"
  type        = string

  validation {
    condition     = can(cidrhost(var.admin_cidr, 0))
    error_message = "admin_cidr must be a valid CIDR block."
  }
}

variable "sip_client_cidr" {
  description = "Trusted IP range allowed to use SIP and RTP"
  type        = string

  validation {
    condition     = can(cidrhost(var.sip_client_cidr, 0))
    error_message = "sip_client_cidr must be a valid CIDR block."
  }
}
