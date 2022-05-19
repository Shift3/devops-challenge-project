# BWTC DevOps Challenge Project
This project represents a challenge to test your knowledge in IaaC. This will also test your ability to deploy resources in AWS. 

## Challenge Instructions
You will begin by creating a fork of this repository to your own Github account. All work will be completed and reviewed within your own fork. Please do not create a Pull Request (PR) back into this repository.

## Project Information

This is a 5 part resource creation using Terraform. Use the following link as a reference: https://registry.terraform.io/providers/hashicorp/aws/latest/docs 

## Project Requirement 1

- **Security Group** -
    - Create a security group that whitelist your IP address, and it uses ssh port 22.  

## Project Requirement 2

- **Key Pair**
    - You will need to know how to generate a key pair in order to use this resource. This key pair will be useful as the will be needed in Project Requirement 3.
    You can read more about generating a key pair using this link: https://www.ssh.com/academy/ssh/keygen
    
## Project Requirement 3

- **EC2**: Create an EC2 instance using the following requirements.
    - Size: t3.micro
    - Security Group: Use the SG created in Project requirement 1
    - Storage: 10gb Standard SSD
    - IAM Role: arn:aws:iam::961064903225:role/S3ReadWrite
    - key_name - Attach the KeyPair resource created in Project Requirement 2.
    - VPC: Default (public subnet)

## Project Requirement 4

- **S3 Bucket creation**
    - Create the S3 bucket using "yourinitials-s3bucket-challenge"
  
## Project Requirement 5

- **Route 53**
    - Setup subdomain record to be "yourinitials.bwtcdevopschallenge.com"
    - Make an A record to point the subdomain to the EC2.

## Running the project

We will run the project for you to see if the configuration is correct. Once we spin up the resources our final step will be to have you query the s3 bucket in project requirement 4 from inside the EC2 instance. Think of it like a walk-through where you will give us answers to questions such as "how do we get into the instance", "what are the
requirements to query things from the instance", etc. 

