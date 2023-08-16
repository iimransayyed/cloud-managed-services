#terraform backend s3 bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket              = "${local.account_id}-terraform-backend-state"
  acl                 = var.acl_value
  force_destroy       = "true"
  object_lock_enabled = true
  versioning {
    enabled = var.versioning
  }
  tags = var.tags
}

# S3 Bucket Policy
resource "aws_s3_bucket_public_access_block" "terraform_state-backend-bucket-policy" {
  bucket = aws_s3_bucket.terraform_state.id
  block_public_acls   = true
  block_public_policy = true
}

# S3 Server Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_server_side_encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#terraform backend ddb table
resource "aws_dynamodb_table" "terraform-backend-lock" {
  attribute {
    name = "LockID"
    type = "S"
  }

  hash_key       = "LockID"
  name           = var.table_name
  read_capacity  = 1
  write_capacity = 1
  tags           = var.tags
}