aws_region = "us-east-1"
vpc_cidr            = "172.22.0.0/16"
vpc_name            = "DevOpsB1-Vpc"
vpc_IGW             = "DevOpsB1-IGW"
Public_Subnet_Cidr  = ["172.22.1.0/24", "172.22.2.0/24"]
Private_Subnet_Cidr = ["172.22.10.0/24", "172.22.20.0/24"]
azs                 = ["us-east-2a", "us-east-2b", "us-east-2c"]
ami = {
  us-east-1  = "ami-052efd3df9dad4825",
  us-east-2 = "ami-02f3416038bdb17fb"
}
key= {
  us-east-1  = "AWSB4-KEY",
 us-east-2 = "AWSB4-OHIO"
}

