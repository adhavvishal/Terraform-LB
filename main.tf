resource "aws_lb" "test-lb-tf11" {
  name               = "test-lb-tf11"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.vpc_security_group_ids]
  subnets            = var.subnet_id

  enable_deletion_protection = false

}

resource "aws_lb_target_group" "lb-tg" {
  name     = "lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "test-lb-tf11" {
  target_group_arn = aws_lb_target_group.lb-tg.arn
  target_id        = "i-0b28b10ebba013680"
  port             = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test-lb-tf11.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg.arn
  }
}
