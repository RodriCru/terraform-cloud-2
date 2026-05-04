ohio_cidr = "10.20.0.0/16"
#public_subnet = "10.20.0.0/24"
#private_subnet = "10.20.1.0/24"

#ohio_cidr = {
#  "prod" = "172.168.0.0/24"
#  "dev" = "10.20.0.0/24"
#}

subnets = [ "10.20.0.0/24", "10.20.1.0/24" ]

tags = {
    "env"="dev"
    "owner"="Luis"
    "cloud"="AWS"
    "IAC"="Terraform"
    "IAC_Version"="1.14.9"
    "project" ="temi"
    "region" ="Ohio"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami" = "ami-0a1b6a02658659c2a"
  "instance_type" = "t3.micro"
}

enable_monitoring = 0

ingress_port_list = [ 22,80,443 ]