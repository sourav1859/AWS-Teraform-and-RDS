
# WordPress EC2 Instance
resource "aws_instance" "wordpress_ec2" {
  ami                    = data.aws_ami.amazon_linux_2023.id  # Use the AMI we filtered above
  instance_type          = "t2.micro"  # Free tier eligible instance type
  subnet_id              = aws_subnet.public_subnet.id  # Place in the public subnet
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]  # Attach the EC2 security group
  key_name               = var.key_name  # Replace with your SSH key pair name

  # TODO: Pass in the 4 variables to the user data script
    user_data = templatefile("wp_rds_install.sh", {
      DB_NAME = var.db_name,
      DB_USER = var.db_username,
      DB_PASS = var.db_password,
      DB_HOST = aws_db_instance.wordpress_db.endpoint
    })  
  

  tags = {
    Name = "WordPress and RDS EC2 Instance"
  }
}
