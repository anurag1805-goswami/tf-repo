output "instances" {
    value = aws_instance.naga[*].id
  
}