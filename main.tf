provider "aws" {
  region  = "eu-central-1"
}
terraform {
   backend "s3" {
    bucket = "skyvalley-terraform"
    key    = "default.tfstate"
    region = "eu-central-1"
  }
}
module "kubernetes" {
  source = "./kubernetes"
  ami = "ami-065deacbcaac64cf2"
  cluster_name = "skyvalley"
  master_instance_type = "t3.medium"
  nodes_max_size = 1
  nodes_min_size = 1
  private_subnet01_netnum = "1"
  public_subnet01_netnum = "2"
  region = "eu-central-1"
  vpc_cidr_block = "10.240.0.0/16"
  worker_instance_type = "t3.medium"
  vpc_name = "kubernetes"
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCb/qtCvn8OM384/wAx8/j//fApSJ6RMz8yyAgzmywRZBCTyDRnQQsZ+Wq87CJsBNe15oL2uMFFBKB6suaSa8LpT4coSdb7w28LMbzOFjWQRHwQSGBtdlgyK82h7eIexBVed2pFOSMpVF/nl0RR/u1BHpLtmoEjHaIFz0N7oS7fhTrkysZeoFBRxH2zFq4eJ9tH9Ig7EwdCvdpWlAdGUHk4St7l2MjG8GqPEqwA3Mwf/SBnW9lOGD7J12HTX+gx4jGFdV2NoqBpXLu9dy2lrpwCHrgY2LRCDrhMSmJFglYrpRIM+gGt2472ar3rXYozCtNeuTtrX29Sx2fD9Y6otTBwm1K5Ke1cuNk2jlwV27ywYO0r9Uk8QWtnPzhUAb0ae5xe3ZKcjlUXtgYUgoxAvkPCg6PuYxxqOgY52lkIwqqmqWnjeHAWjH0aUOEYlxSwyHlXQtp2EkXG5BcppQPY152MN7EOTgfILgp+gKcgJzLT1pUxukgW2x77dGsDkOEgZVs= root@ip-172-31-45-235"
} 
