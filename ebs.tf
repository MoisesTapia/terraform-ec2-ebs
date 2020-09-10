resource "aws_ebs_volume" "new_volumen" {
    availability_zone       = data.aws_availability_zones.available.names[0]
    size    = 20

    tags = {

        Name                = var.all_tags[8]
        Enviroment          = var.all_tags[1]
        Maintainer          = var.all_tags[2]
    }
}

resource "aws_volume_attachment" "ebs_attach" {

    device_name = var.all_tags[9]
    volume_id   = aws_ebs_volume.new_volumen.id
    instance_id = aws_instance.Server1.id

    depends_on = [aws_ebs_volume.new_volumen]

}