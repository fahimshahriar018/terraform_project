output "instance_ami_id" {
	value = data.aws_ami.centos_7.id	

}

output "instance_region" {
	value = var.region
}

output "instance_id" {

	value = aws_instance.terraform_server.id
}

#output "eip_id" {
#	value = aws_eip.terraform_eip.id

#}
#output "instance_elastic_ip" {
#	value = aws_eip.terraform_eip.public_ip
#}

output "instance_root_volume_id" {
	value = aws_instance.terraform_server.root_block_device.0.volume_id

}

output "server_public_ip" {
	value = aws_instance.terraform_server.public_ip

}



