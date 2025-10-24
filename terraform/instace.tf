resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = module.network.public_subnet_id
  associate_public_ip_address = true
  count         = var.instance_count

  vpc_security_group_ids = [aws_security_group.allow_http.id]
    
  tags = {
    Name = "web_server-${count.index+1}"
  }
}
resource "aws_security_group" "allow_http" {

  name        = "allow_http"
  description = "Allow http port on web server"
  vpc_id      = module.network.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {

    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}