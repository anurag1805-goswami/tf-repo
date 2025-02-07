variable "vpc_cidr" {
    description = "VPC CIDR Range"
    type = string
}


variable "subnet_cidr" {
    description = "subnet CIDR Range"
    type = list(string)
}

variable "subnet_names" {
    description = "Name of teh subnet"
    type = list(string)
    default = [ "tf-managed-pub-subnet01", "tf-managed-pub-subnet02" ]
}