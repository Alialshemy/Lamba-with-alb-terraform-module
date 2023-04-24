data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/code/index.js"
  output_path = "${path.module}/index.js.zip"
}
