resource "aws_vpc" "public_vpc" {

    cidr_block              = var.aws_networking[0]
    instance_tenancy        = var.instance_tenancy
    enable_dns_hostnames    = var.enable_dns_hostnames
    enable_dns_support      = var.enable_dns_support
    enable_classiclink      = var.enable_classiclink

    tags = {

        Name                = var.all_tags[4]
        Enviroment          = var.all_tags[1]
        Maintainer          = var.all_tags[2]
    }
}

resource "aws_internet_gateway" "in_gw" {

    vpc_id = aws_vpc.public_vpc.id

    tags = {
        Name                = var.all_tags[5]
        Enviroment          = var.all_tags[1]
        Maintainer          = var.all_tags[2]
    }

    depends_on = [aws_vpc.public_vpc]

}

resource "aws_subnet" "public_subnet"{
    vpc_id                  = aws_vpc.public_vpc.id
    map_public_ip_on_launch = true
    cidr_block              = var.aws_networking[1]
    availability_zone       = data.aws_availability_zones.available.names[0]

    tags = {
        Name    = var.all_tags[6]
        Enviroment          = var.all_tags[1]
        Maintainer          = var.all_tags[2]
    }
    depends_on = [aws_internet_gateway.in_gw]
}

resource "aws_route_table" "public_rt" {
    vpc_id  = aws_vpc.public_vpc.id

    route {
        cidr_block  = var.aws_networking[2]
        gateway_id  = aws_internet_gateway.in_gw.id
    }

    tags = {
        Name                = var.all_tags[7]
        Enviroment          = var.all_tags[1]
        Maintainer          = var.all_tags[2]
    }

    depends_on = [aws_subnet.public_subnet]
}

resource "aws_route_table_association" "public_subnet_rta" {
    subnet_id       = aws_subnet.public_subnet.id
    route_table_id  = aws_route_table.public_rt.id

    depends_on = [aws_route_table.public_rt]
}