resource "aws_lb" "naga_alb" {
  name               = "terraform-alb-naga"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnet_id

  enable_deletion_protection = false

  tags = {
    Environment = "naga_alb"
  }
}

resource "aws_lb_listener" "fnaga_listner" {
  load_balancer_arn = aws_lb.naga_alb.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.naga_tg.arn
  }
}


resource "aws_lb_target_group" "naga_tg" {
  name     = "naga-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "naga-tg-attachement" {
    count = length(var.instance_id)
  target_group_arn = aws_lb_target_group.naga_tg.arn
  target_id        = var.instance_id[count.index]
  port             = 80
}

