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
} 
