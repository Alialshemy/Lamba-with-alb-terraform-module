resource "aws_lambda_permission" "allow_alb_to_invoke_lambda" {
  statement_id  = "AllowExecutionFromALB"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.arn
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = "${aws_lb_target_group.example.arn}"
}

resource "aws_lb" "example" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnets
  security_groups    = [aws_security_group.lb.id]
  tags = {
    Name = var.lb_name
  }
}
resource "aws_lb_target_group" "example" {
  name        = var.lb_name
  port        = 443
  target_type = "lambda"
  protocol    = "HTTPS"
  vpc_id      = var.vpc_id
}

# Create HTTPS listener rule
resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.example.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.example.id


  }
}
resource "aws_security_group" "lb" {
  name_prefix = "fintech-dev-upg-callback-lb-sg-"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"


  }
  }

  resource "aws_lb_target_group_attachment" "main" {
  target_group_arn = "${aws_lb_target_group.example.arn}"
  target_id        = "${aws_lambda_function.lambda.arn}"
   depends_on       = [aws_lambda_permission.allow_alb_to_invoke_lambda]
}
