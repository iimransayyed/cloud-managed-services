output "s3_bucket_arn" {
  description = "arn of the bucket"
  value       = aws_s3_bucket.terraform_state.arn
}
output "s3_bucket_id" {
  description = "S3 Bucket ID"
  value       = aws_s3_bucket.terraform_state.id
}
output "table_id" {
  value       = join("", aws_dynamodb_table.terraform-backend-lock.*.id)
  description = "DynamoDB table ID"
}
output "table_arn" {
  value       = join("", aws_dynamodb_table.terraform-backend-lock.*.arn)
  description = "DynamoDB table ARN"
}