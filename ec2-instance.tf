resource "aws_instance" "my_ec2" {
  ami           = var.ami[1]  # Amazon Linux 2 AMI ID for ap-south-1 region
  instance_type = var.instance_type[1]
  subnet_id = aws_subnet.pvt_subnet.id
  key_name      =  aws_key_pair.new-tf-key.key_name
  security_groups = [aws_security_group.private_sg.id]
  associate_public_ip_address = var.use_public_ip
  
  tags = var.aws_instant_tag
}

resource "aws_instance" "bastion" {
  ami           = var.ami[0]  # Amazon Linux 2 AMI ID for ap-south-1 region
  instance_type = var.instance_type[0]
  subnet_id = aws_subnet.pub_subnet.id
  key_name      =  aws_key_pair.new-tf-key.key_name
  security_groups = [aws_security_group.bastion_sg.id]
  #associate_public_ip_address =  var.use_public_ip ? true : false
  
  tags = var.bastion
}