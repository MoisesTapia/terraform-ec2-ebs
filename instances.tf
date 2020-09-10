resource "aws_instance" "Server1" {
    ami                     = var.aws_ami
    instance_type           = var.aws_insta_type
    vpc_security_group_ids  = [aws_security_group.public_secgroup.id]
    subnet_id               = aws_subnet.public_subnet.id
    availability_zone       = data.aws_availability_zones.available.names[0]

    tags = {
        Name                = var.all_tags[0]
        Enviroment          = var.all_tags[1]
        Maintainer          = var.all_tags[2]
    }
}