module "vpc"  {
    source = "terraform-aws-modules/vpc/aws"

    cidr = var.vpc_cidr
    public_subnets = var.public_subnet
    map_public_ip_on_launch = true
    
    azs = data.aws_availability_zones.azs.name
    enable_dns_hostnames = true
    
    tags ={
          name = var.vpc.id
          env = var.environment
    }

public_subnet_tags = {
  Name = var.environment
}

}

# module "aws_subnets" {
#     source =""
#     vpc_id = var.aws_vpc.default.id
#     cidr_block = var.public_subnet_cidr
#     availiability = us-east-1

#     tags={

#         Name = var.public_subnet_name
#     }
# }

# module "aws_internet_gateway"{
#     source = ""
#     vpc_id = var.aws_vpc.default_id
#     tags = {
#     Name = var.IGW.name
#     }

# }

resource "aws_route_table" "terraform-public"{
    vpc_id = "aws_vpc.default_id"
    route = {
        cidr_block = "0.0.0.0/0 "
        gateway_id = "aws_internet_gateway.default.id"
    }
    tags ={
        Name = "var.Main_Routing_Table"
    }
}

# module  "aws_route_table_association"  {
#     source = ""
#     subnet_id = var.aws_subnet.subnet1-public.id
#     route_table_id = var.aws_route_table.terraform-public.id
# }

# module "aws_security_group"  {
#     source = "terraform-aws-modules/security-group/aws"
#     name        = "allow_all"
#     description = "Allow all inbound traffic"
#     vpc_id      = "${aws_vpc.default.id}"

#   ingress_with_cidr_blocks = {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress_with_cidr_blocks =  {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#     }
# }

#################################### Security Group #########################################

module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "Test-SG"
  description = "Security group for Test SG"
  vpc_id      = module.vpc.default_vpc_id

  ingress_cidr_blocks      = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "Http"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp" 
      description = "ssh"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}