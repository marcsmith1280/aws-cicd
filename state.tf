#Provider Configuration, use the S3 bucket created to store TF State files

terraform{
    backend "s3" {
        bucket = "cicd-pipeline-tf-state"
        encrypt = true
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {
    region = "us-east-1"
}
