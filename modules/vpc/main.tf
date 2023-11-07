module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "DEV-vpc"
  cidr = "10.1.0.0/16"

  azs = ["us-east-1a", "us-east-1b"]
}

resource "aws_subnet" "public1" {
  cidr_block        = "10.1.0.0/24"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "us-east-1a"

  tags = {
    Name = "DEV-Public1"
  }
}

resource "aws_subnet" "public2" {
  cidr_block        = "10.1.1.0/24"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "us-east-1b"

  tags = {
    Name = "DEV-Public2"
  }
}
resource "aws_subnet" "private1" {
  cidr_block        = "10.1.2.0/24"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "us-east-1a"

  tags = {
    Name = "DEV-Private1"
  }
}
resource "aws_subnet" "private2" {
  cidr_block        = "10.1.3.0/24"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "us-east-1b"

  tags = {
    Name = "DEV-Private2"
  }
}

resource "aws_default_security_group" "dev-default" {
  vpc_id = module.vpc.vpc_id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


