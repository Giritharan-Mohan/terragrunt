
variable "vpc_cidr_block" {
  type    = string

}

variable "enable_dns_support" {
  type    = string
 
}

variable "enable_dns_hostnames" {
  type    = string
  
}

variable "vpcname" {
  type    = string
  
}

variable "igwname" {
  type    = string
  
}

variable "public_subnet_cidr_blocks" {
  type    = list(string)
  
}

variable "private_subnet_cidr_blocks" {
  type    = list(string)
  
}

variable "rtname" {
  type    = string
  
}

variable "naclname" {
  type    = string
  
}
