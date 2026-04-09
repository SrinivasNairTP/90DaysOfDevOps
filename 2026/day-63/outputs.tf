output "vpc" {
  
    value = aws_vpc.vpc1.id


}

output "subnet" {
  
    value = aws_subnet.subnet1.id

}

output "instance" {
  value = aws_instance.tws_instance

}

output "instancepublicip" {
  value = aws_instance.tws_instance.public_ip

}

output "instancedns" {
  
    value = aws_instance.tws_instance.public_dns
}

output "securitygroup" {
  
  value = aws_security_group.sg1.id

}

output "instance_type"{
    value = aws_instance.tws_instance.instance_type
}