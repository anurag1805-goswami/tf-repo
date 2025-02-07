variable "sg_id" {
    type = string
    description = "SG ID for EC2"
}

variable "subnet_id" {
    type = list(string) 
    description = "subnet id for ec2"
}

variable "ec2_names" {
    type = list(string) 
    description = "subnet id for ec2"
    default = [ "naga-sadhu", "naga-vidushi" ]
}