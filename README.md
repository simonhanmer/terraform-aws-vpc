# VPC Creation
This Terraform code will deploy one of two typical AWS VPC configurations.

In both cases, the following items will be deployed :
* An AWS VPC
* Public subnets with an associated [Internet Gateway (IGW)](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html) in the specified number of availability zones.
* Two Private subnets in the specified number of availability zones.
  
If the variable `createNATGateways` is set to true, the following will also be created:
* A [NAT Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html) in each public subnet
* Routing to allow items in the private subnet to access the Internet via the appropriate NAT Gateway.

