resource "aws_db_subnet_group" "private_subnet_group" {
  name       = "private-db-subnet-group"
  subnet_ids = [module.network.private_subnet_id]  
  tags = {
    Name = "PrivateDBSubnetGroup"
  }
}


resource "aws_db_instance" "mydb" {
  identifier              = "mydb-instance"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.instance_type
  username                = "admin"
  password                =var.password
  db_subnet_group_name = aws_db_subnet_group.private_subnet_group.id
  vpc_security_group_ids  = [aws_security_group.allow_access.id]
  publicly_accessible     = false


  tags = {
    Name = var.db_name
  }

}
resource "aws_security_group" "allow_access" {

  name        = "allow_sql"
  description = "Allow access  from web server"
  vpc_id      = module.network.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {

    description = "Allow sql port"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  tags = {
    name = "db_sg"
  }
}