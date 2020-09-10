data "aws_availability_zones" "available" {
    state = "available"
}

output "Availability_Zones" {
  value = data.aws_availability_zones.available.names
}