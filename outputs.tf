output "function_arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function."
  value       = var.create_aws_lambda_function ? element(concat(aws_lambda_function.lambda.*.arn, [""]), 0) : null
}

output "qualified_arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function Version."
  value       = var.create_aws_lambda_function ? element(concat(aws_lambda_function.lambda.*.qualified_arn, [""]), 0) : null
}

output "invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri"
  value       = var.create_aws_lambda_function ? element(concat(aws_lambda_function.lambda.*.invoke_arn, [""]), 0) : null
}

output "version" {
  description = "Latest published version of your Lambda Function."
  value       = var.create_aws_lambda_function ? element(concat(aws_lambda_function.lambda.*.version, [""]), 0) : null
}

output "last_modified" {
  description = "The date this resource was last modified."
  value       = var.create_aws_lambda_function ? element(concat(aws_lambda_function.lambda.*.last_modified, [""]), 0) : null
}

output "kms_key_arn" {
  description = "The ARN for the KMS encryption key."
  value       = var.create_aws_lambda_function ? element(concat(aws_lambda_function.lambda.*.kms_key_arn, [""]), 0) : null
}

output "source_code_hash" {
  description = "Base64-encoded representation of raw SHA-256 sum of the zip file, provided either via filename or s3_* parameters."
  value       = var.create_aws_lambda_function ? element(concat(aws_lambda_function.lambda.*.source_code_hash, [""]), 0) : null
}

output "source_code_size" {
  description = "The size in bytes of the function .zip file."
  value       = var.create_aws_lambda_function ? element(concat(aws_lambda_function.lambda.*.source_code_size, [""]), 0) : null
}

output "log_group_arn" {
  description = "The Amazon Resource Name (ARN) specifying the lambda log group."
  value       = var.create_aws_lambda_function ? element(concat(aws_cloudwatch_log_group.lambda_log_group.*.arn, [""]), 0) : null
}

