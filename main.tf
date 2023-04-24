module "lamba" {
  source ="./lamba"
  name= ""
  certificate_arn= ""
  lb_name= ""
  subnets =["subnets"]
  vpc_id = ""
  role_name = ""
  sqs_name_policy = ""
  cloudwatch_name_policy = ""
  environment = ""
}
