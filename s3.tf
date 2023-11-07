#
resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "cicd-pipeline-artifacts-6sports"
} 

resource "aws_s3_bucket_acl" "main" {
  bucket = aws_s3_bucket.codepipeline_artifacts.id
  acl = "private"
  depends_on = [ aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership ]
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.codepipeline_artifacts.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.codepipeline_artifacts.id
  versioning_configuration {
    status = "Enabled"
  }
}