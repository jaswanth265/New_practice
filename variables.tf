variable "vpc_cidr"{
    description = "vpc cidr"
    type = string
}

variable "public_subnet"{
    description = "subnets_cidr"
    type = list(string)
}

variable "environment" {
    description = "value"
    type = string
  
}