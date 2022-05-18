#Here you will configure your terraform and backend 
terraform {
  backend "s3" {
    bucket  = "shift3-devopschallenge"
    key     = "shift3-devopschallenge/terraform.tfstate"
    region  = "us-west-2"   
  }
}

# Here you will configure your provider (AWS)
provider "aws" {
  

}

#Gets the default vpc
data "aws_vpc" "default" {
default = true
}

#Gets the defaults VPC's security group
data "aws_security_group" "defaultvpc" {
  vpc_id = data.aws_vpc.default.id

  filter {
    values = ["default"]
  }
}
#Queries zone ID
data "aws_route53_zone" "selected" {
  name         = "bwtcdevopschallenge.com."
}

#Here you will configure your security group to allow SSH on port 22 from ONLY your IP address.
resource "aws_security_group" "allow_ssh" {
 

}

#Here you will provide your keypair. Currently this resource requires an existing user-supplied key pair. This key pair's public key will be registered with AWS to allow logging-in to EC2 instances.
#Read about it here https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
resource "aws_key_pair" "deployer" {
  key_name   = "Name of Key "
  public_key = "ssh-rsa key"
}

# #Here You will be creating the EC2 server. 
resource "aws_instance" "web" {
  vpc_security_group_ids = [
      "${data.aws_security_group.defaultvpc.ids}",
  ]
  subnet_id     = "subnet-09de13c1905b48a9e"
  ami           = "ami-0ca285d4c2cda3300"

  root_block_device {
    #Fill out the volume size and storage in here.
  }
}


#Create S3 
resource "aws_s3_bucket" "bucket_creation" {


}

#Create route 53 A record to point to IP of EC2
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id

}

