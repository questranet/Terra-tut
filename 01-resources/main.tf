resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-02ce98398a09666eb"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z08999912AI7EUJ47AGDO"
  name    = "frontend.waleapagun.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}