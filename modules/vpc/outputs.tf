output "vpc_id" {
    value = aws_vpc.naga_vpc.id
  
}

output "sububet_id" {
    value = aws_subnet.naga_subnets[*].id
  
}

