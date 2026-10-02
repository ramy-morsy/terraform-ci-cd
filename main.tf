resource "aws_instance" "marihan" {
    ami = var.ami
    instance_type = var.instance_type

 tags = {
    Name = "Marihan" # Must be capital "N"
  } 
}

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "ramy-project-tf-state" # REPLACE WITH YOUR BUCKET NAME
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_crypto_conf" {
  bucket        = aws_s3_bucket.terraform_state.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
