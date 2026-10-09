region      = "eu-west-1"
name_prefix = "cmtr-35arqg4r-01"
vpc_cidr    = "10.10.0.0/16"

public_subnets = {
  a = {
    cidr_block        = "10.10.1.0/24"
    availability_zone = "eu-west-1a"
  }
  b = {
    cidr_block        = "10.10.3.0/24"
    availability_zone = "eu-west-1b"
  }
  c = {
    cidr_block        = "10.10.5.0/24"
    availability_zone = "eu-west-1c"
  }
}

internet_cidr = "0.0.0.0/0"