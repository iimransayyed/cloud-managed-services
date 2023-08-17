# Set variables
variable "environment_name" {
  type        = string
  description = "Set environment name"
  default     = "Staging"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "20.1.0.0/16"
}

variable "additional_tags" {
  type        = map(string)
  description = "Variable if additional tags is needed"
  default     = {}
}