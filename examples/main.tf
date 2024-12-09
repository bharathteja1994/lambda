module "terraform_aws_kms_service" {
  source  = "./kms"

  #Required Parameters
  service_name   = ["lambda", "logs"]                                                                               #Service name to allow for KMS access in a form of list. E.g. ['s3', 'fsx']
  description    = "lambda kms"                                                                                     #The description of the key as viewed in AWS console.
  kms_alias_name = "test-lambda" #KMS key alias name

  #Optional Parameters
  #multi_region  = false       #Indicates whether the KMS key is a multi-Region (true) or regional {false). Default is false. Note: It should be enbled only for 'Distator Recovery' purpose
  #create_kms_key= true        #A boolean that indicates whether to create KMS key or not. Default is true

}


module "lambda" {

  source = "./lambda"


  #Required Parameters
  function_name          = "test-lambda"                              #A unique name for your Lambda Function.
  handler                = "lambda_function.lambda_handler"                   #The function entrypoint in your code.
  kms_key_arn            = module.terraform_aws_kms_service.kms_arn["lambda"] #Amazon Resource Name (ARN) of customer managed CMK should be used for encryption.
  role                   = module.iam-role.iamrole_arn                        #IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to.
  lambda_logs_kms_key_id = module.terraform_aws_kms_service.kms_arn["logs"]   #The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested.


  #Optional parameters
  create_aws_lambda_function = false                 #Controls if Lambda shoulbd be created
  source_code_location       = "local"               #The location of source code. It can be either s3 or local or ecr.
  filename                   = "lambda_function.zip" #Required when "source_code_location" is "local" and need to provide valid value for the attribute .The path to the function's deployment package within the local filesystem. If defined, The s3_-prefixed options cannot be used.
  # ephemeral_storage = [{
  #   size = 512
  # }] # The size of the Lambda function Ephemeral storage(/tmp) represented in MB. The minimum supported ephemeral_storage value defaults to 512MB and the maximum supported value is 10240MB.
  # lambda_environment = {
  #   variables = {
  #     "test"  = "test"
  #     "test1" = "test1"
  #   }
  # } #The Lambda environment's configuration settings.

}
