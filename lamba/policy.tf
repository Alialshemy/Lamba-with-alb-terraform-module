resource "aws_iam_policy" "lamba_sqs_policy" {
  name        = var.sqs_name_policy
  path        = "/"
  description = "policy to lamba to access sqs"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sqs:SendMessage",
            "Resource": "*"
        }
    ]
}
EOF
 
}
resource "aws_iam_policy" "lamba_cloudwatch_policy" {
  name        = var.cloudwatch_name_policy
  path        = "/"
  description = "policy to lamba to access cloudwatch"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "logs:CreateLogStream",
              "logs:PutLogEvents",
              "logs:CreateLogGroup"	

            ],
            "Resource": "*"
        }
    ]
}
EOF
 
}

