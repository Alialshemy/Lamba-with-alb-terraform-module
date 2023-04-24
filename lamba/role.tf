resource "aws_iam_role" "lamba_role" {
  name = var.role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}
resource "aws_iam_role_policy_attachment" "attach_policy_sqs" {
  role       = aws_iam_role.lamba_role.name
  policy_arn = aws_iam_policy.lamba_sqs_policy.arn
}
resource "aws_iam_role_policy_attachment" "attach_policy_cloudwatch" {
  role       = aws_iam_role.lamba_role.name
  policy_arn = aws_iam_policy.lamba_cloudwatch_policy.arn
}