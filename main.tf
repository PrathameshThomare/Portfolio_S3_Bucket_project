#create S3 bucket
resource "aws_s3_bucket" "mybuckett" {
  bucket = var.mybuckett

}
# AWS ownership code to access bucket
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybuckett.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#To make AWS bucket public
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybuckett.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#AWS ACL(Access Control List):Amazon S3 access control lists (ACLs) enable you to manage access to buckets and objects
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.mybuckett.id
  acl    = "public-read"
}

#create objects in S3 bucket
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybuckett.id
  key = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.mybuckett.id
  key = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "profile" {
  bucket = aws_s3_bucket.mybuckett.id
  key = "profile.jpg"
  source = "profile.jpg"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybuckett.id

  index_document {
    suffix = "index.html"

  }
  error_document {
    key = "error.html"
  }
  depends_on = [ aws_s3_bucket_acl.example ]
}
  
