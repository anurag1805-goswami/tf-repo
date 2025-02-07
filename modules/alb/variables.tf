variable "sg_id" {
    description = "ALB security group"
    type = string
  
}

variable "subnet_id" {
    description = "subnet id foer ALB"
    type = list(string)
  
}

variable "vpc_id" {
    description = "vpc id foer ALB"
    type = string
  
}

variable "instance_id" {
    description = "ID for the target instance"
    type = list(string)
  
}

