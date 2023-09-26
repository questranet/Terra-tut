resource "aws_instance" "frontend" {
  ami           = "data.aws_ami.ami.image_id"
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

resource "aws_instance" "backend" {
  ami           = "data.aws_ami.ami.image_id"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-02ce98398a09666eb"]

  tags = {
    Name = "backend"
  }
}

resource "aws_route53_record" "backend" {
  zone_id = "Z08999912AI7EUJ47AGDO"
  name    = "backend.waleapagun.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.backend.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = "data.aws_ami.ami.image_id"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-02ce98398a09666eb"]

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z08999912AI7EUJ47AGDO"
  name    = "mysql.waleapagun.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}