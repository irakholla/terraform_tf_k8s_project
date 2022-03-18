resource "aws_security_group" "main_test_security_group" {
  name               = var.securyty_group_name
  vpc_id             = var.vpcid

  ingress {
    from_port        = var.ingress_from_port
    to_port          = var.ingress_to_port
    protocol         = var.ingres_protocol
    cidr_blocks      = [var.ingress_cidr_block]
  }

  egress {
    from_port        = var.egress_from_port
    to_port          = var.egress_to_port
    protocol         = var.egress_protocol
    cidr_blocks      = [var.egress_cidr_blocks]
  }

  tags = {
    Name = var.name_tag
  }
}