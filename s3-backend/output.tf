data "aws_region" "current" {}
output "region" {
  value = data.aws_region.current.name
}

output "bucket" {
  value = aws_s3_bucket.s3_bucket.bucket
}

output "role_arn" {
  value = aws_iam_role.iam_role.arn
}

output "dynamodb_table" {
  value = aws_dynamodb_table.dynamodb_table.name
}