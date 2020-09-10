resource "aws_security_group" "public_secgroup" {
    name    = var.all_tags[3]
    vpc_id  = aws_vpc.public_vpc.id

    dynamic "ingress" {
        iterator = port
        for_each = var.aws_public_sec_ingress
        content {

            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }

    }

    dynamic "egress" {

        iterator = port
        for_each = var.aws_public_sec_egress
        content {
            
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }

    }

    tags = {

        Name            = var.all_tags[3]
        Enviroment      = var.all_tags[1]
        Maintainer      = var.all_tags[2]

    }
}