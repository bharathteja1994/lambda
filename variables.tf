#Lambda Variables
variable "create_aws_lambda_function" {
  description = "(Optional) \"Default : true\". Controls if Lambda shoulbd be created"
  type        = bool
  default     = true
}
variable "source_code_location" {
  type        = string
  description = "(Optional) \"Default : \"s3\" \". The location of source code. It can be either s3 or local or ecr."
  default     = "s3"
}

variable "filename" {
  type        = string
  description = "(Optional) Default : \"\" \". Required when \"source_code_location\" is \"local\" and need to provide valid value for the attribute .The path to the function's deployment package within the local filesystem. If defined, The s3_-prefixed options cannot be used."
  default     = ""
}

variable "source_code_hash" {
  type = string
  description = "(Optional) Default : null. Required when \"source_code_location\" is \"s3\" and need to provide valid value for the attribute .Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key. The usual way to set this is filebase64sha256(\"file.zip\") (Terraform 0.11.12 and later) or base64sha256(file(\"file.zip\")) (Terraform 0.11.11 and earlier), where \"file.zip\" is the local filename of the lambda function source archive."
  default = null
}

variable "function_name" {
  type        = string
  description = "(Required) A unique name for your Lambda Function."
}

variable "s3_bucket" {
  type        = string
  description = "(Optional) \"Default : \"\" \". The S3 bucket location containing the function's deployment package."
  default     = ""
}

variable "s3_key" {
  type        = string
  description = "(Optional) \"Default : \"\" \". The S3 key of an object containing the function's deployment package."
  default     = ""
}

variable "s3_object_version" {
  type        = string
  description = "(Optional) \"Default : \"\" \". The object version containing the function's deployment package."
  default     = ""
}

variable "dead_letter_target_arn" {
  type        = string
  description = "(Optional) \"Default : \"\" \". The ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the sns:Publish or sqs:SendMessage action on this ARN, depending on which service is targeted."
  default     = ""
}

variable "tracing_config_mode" {
  type        = string
  description = "(Optional) \"Default : \"\" \". Can be either PassThrough or Active. If PassThrough, Lambda will only trace the request from an upstream service if it contains a tracing header with sampled=1. If Active, Lambda will respect any tracing header it receives from an upstream service. If no tracing header is received, Lambda will call X-Ray for a tracing decision."
  default     = ""
}

variable "layers" {
  type        = list(any)
  description = "(Optional) \"Default : []\". List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function."
  default     = []
}

variable "memory_size" {
  type        = string
  description = "(Optional) \"Default : \"128\" \". Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128."
  default     = "128"
}

variable "reserved_concurrent_executions" {
  type        = string
  description = "(Optional) \"Default : \"-1\" \". The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1."
  default     = "-1"
}

variable "publish" {
  type        = string
  description = "(Optional) \"Default : false\". Whether to publish creation/change as new Lambda Function Version. Defaults to false."
  default     = "false"
}

variable "file_system_config_arn" {
  type        = string
  description = "(Optional) \"Default : \" \" \". The Amazon Resource Name (ARN) of the Amazon EFS Access Point that provides access to the file system."
  default     = ""
}

variable "local_mount_path" {
  type        = string
  description = "(Optional) \"Default : \" \" \". The path where the function can access the file system, starting with /mnt/."
  default     = ""
}

variable "description" {
  type        = string
  description = "(Optional) \"Default : \" \" \". Description of what your Lambda Function does."
  default     = ""
}

variable "handler" {
  type        = string
  description = "(Required) The function entrypoint in your code."
}

variable "runtime" {
  type        = string
  description = "(Optional) \"Default : \"nodejs20.x\" \" . Valid runtimes: nodejs10.x | nodejs12.x | java8 | java11 | python2.7 | python3.6 | python3.7 | python3.8 | dotnetcore2.1 | dotnetcore3.1 | go1.x | ruby2.5 | ruby2.7 | valid values can check [here](https://docs.aws.amazon.com/lambda/latest/dg/API_CreateFunction.html#SSS-CreateFunction-request-Runtime"
  default     = "nodejs20.x"
}

variable "timeout" {
  type        = string
  description = "(Optional) \"Default : \"15\" \". The amount of time your Lambda Function has to run in seconds. Max: 900 (15 min)"
  default     = "15"
}

variable "kms_key_arn" {
  type        = string
  description = "(Required) Amazon Resource Name (ARN) of customer managed CMK should be used for encryption."
}

variable "subnet_ids" {
  type        = list(any)
  description = "(Optional) \"Default : []\". A list of subnet IDs associated with the Lambda function."
  default     = []
}

variable "security_group_ids" {
  type        = list(any)
  description = "(Optional) \"Default : []\". A list of security group IDs associated with the Lambda function."
  default     = []
}

variable "lambda_environment" {
  type        = map(any)
  description = "(Optional) \"Default : {}\". The Lambda environment's configuration settings."
  default     = {}
}

variable "role" {
  type        = string
  description = "(Required) IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to."
}

variable "image_config" {
  type        = any
  description = "(Optional) \"Default : []\". Configuration block."
  default     = []
}

variable "image_uri" {
  type        = any
  description = "(Optional) \"Default : null\". ECR image URI containing the function's deployment package. Conflicts with filename, s3_bucket, s3_key, and s3_object_version."
  default     = null
}

variable "package_type" {
  type        = string
  description = "(Optional) \"Default : null\". Lambda deployment package type. Valid values are Zip and Image."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Required) A mapping of tags to assign to the resource"
}

variable "architectures" {
  type        = any
  description = "(Optional) \"Default : [\"x86_64\"] \". Instruction set architecture for your Lambda function. Valid values are [\"x86_64\"] and [\"arm64\"].  Removing this attribute, function's architecture stay the same."
  default     = ["x86_64"]
}

variable "code_signing_config_arn" {
  type        = string
  description = "(Optional) \"Default : null\". To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function."
  default     = null
}

variable "ephemeral_storage" {
  type        = any
  description = "(Optional) \"Default : []\". The size of the Lambda function Ephemeral storage(/tmp) represented in MB. The minimum supported ephemeral_storage value defaults to 512MB and the maximum supported value is 10240MB."
  default     = []
}

#Log Group Variables
variable "skip_destroy" {
  type        = bool
  description = "(Optional) \"Default : false\". Set to true if you do not wish the log group (and any logs it may contain) to be deleted at destroy time, and instead just remove the log group from the Terraform state."
  default     = false
}

variable "retention_in_days" {
  type        = number
  description = "(Optional) \"Default : 90\". Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0. If you select 0, the events in the log group are always retained and never expire."
  default     = 90
}

variable "lambda_logs_kms_key_id" {
  type        = string
  description = "(Optional) \"Default : 90\". The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested."
}

variable "logging_config"{
  description = "(Optional) \"Default : {}\".Configuration block used to specify advanced logging settings"
  type = any
  default = {}
}

variable "create_aws_cloudwatch_log_group" {
  description = "(Optional) \"Default : true\". Controls if Cloudwatch Log Group should be created"
  type = bool
  default = true
}

variable "snap_start" {
  type = any
  description = "(Optional) \"Default : {}\".This feature is currently only supported for java11, java17 and java21 runtimes. Snap start settings block"
  default = {}
  
}
