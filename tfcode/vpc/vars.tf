# Set variables
variable "environment_name" {
  type        = string
  description = "Set environment name"
  default     = "Staging"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.1.0.0/16"
}

variable "availability_zone" {
  type        = list(string)
  description = "Availability Zone"
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "additional_tags" {
  type        = map(string)
  description = "Variable if additional tags is needed"
  default = {
    Owner            = "TJ"
    TerraformManaged = "True"
  }
}

variable "public_subnet_cidr_az_a" {
  type        = list(string)
  description = "Public subnet CIDR within AZ-a"
  default     = ["10.1.0.0/22"]
}

variable "public_subnet_cidr_az_b" {
  type        = list(string)
  description = "Public subnet CIDR within AZ-b"
  default     = ["10.1.4.0/22"]
}

variable "public_subnet_cidr_az_c" {
  type        = list(string)
  description = "Public subnet CIDR within AZ-c"
  default     = ["10.1.8.0/22"]
}

variable "public_subnet_interfix" {
  type        = string
  description = "Give interfix to public subnet name"
  default     = "public"
}

variable "private_subnet_cidr_az_a" {
  type        = list(string)
  description = "Private subnet CIDR within AZ-a"
  default     = ["10.1.12.0/22"]
}

variable "private_subnet_cidr_az_b" {
  type        = list(string)
  description = "Private subnet CIDR within AZ-b"
  default     = ["10.1.16.0/22"]
}

variable "private_subnet_cidr_az_c" {
  type        = list(string)
  description = "Private subnet CIDR within AZ-c"
  default     = ["10.1.20.0/22"]
}
variable "private_subnet_interfix" {
  type        = string
  description = "Give interfix to private subnet name"
  default     = "private"
}

variable "default_route" {
  type        = string
  description = "Default Route from and to internet"
  default     = "0.0.0.0/0"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default     = ""
}