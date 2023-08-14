variable "bucket_name" {
  type    = string
  default = "061058055367-terraform-state"
}
variable "acl_value" {
  default = "private"
}
variable "versioning" {
  type        = bool
  description = "(Optional) A state of versioning."
  default     = "false"
}
variable "table_name" {
  default = "061058055367-terraform-state-lock"
}
variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default = {
    TerraformManaged = "True"
    App_Name         = "TF-Bootstrap"
    Product_name     = "TF-Bootstrap"
  }
}