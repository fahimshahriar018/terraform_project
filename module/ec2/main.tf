resource "aws_instance" "terraform_server" {
	#ami = data.aws_ami.centos_7.id
	ami = "ami-09e67e426f25ce0d7"
	instance_type = var.instance_type
	tags = {
		environment = var.tags["env"]
		createdBy = var.tags["createdBy"]
		description = "A nginx server created by Terraform"
	}
#	private_ip = var.private_ip[0]
	subnet_id = var.subnet_id
	associate_public_ip_address = true
	hibernation = true
	monitoring = false
 	
	#network_interface {
	#	network_interface_id = aws_network_interface.network_interface.id
	#	device_index = 1
#		}
#	user_data = <<-EOF
#		#!/bin/bash
#		sudo apt  update 		
#		sudo apt  install nginx -y
#	        sudo systemctl start nginx
#		sudo systemctl enable nginx
#		EOF

	root_block_device {
		volume_size = var.root_volume_size
		volume_type = var.root_volume_type
		delete_on_termination = var.root_disk_delete
		encrypted = true
		tags = {
			environment = var.tags["env"]
			createdBy = var.tags["createdBy"]
		}
	
	}

	key_name = aws_key_pair.terraform_key.id
	vpc_security_group_ids = [var.security_group_id]
} 
#resource "aws_network_interface" "network_interface" {
#	subnet_id = var.subnet_id
#	private_ips = [var.private_ip]
#	security_groups = [aw_security_group.terraform_security_group.id]

#}

#resource "aws_network_interface_attachment" "network_interface_attachment" {
#	instance_id = aws_instance.terraform_server.id
#	network_interface_id = aws_network_interface.network_interface.id
#	device_index = 1
#}

#resource "aws_eip" "terraform_eip" {
#	vpc = true
#	instance = aws_instance.terraform_server.id
#	associate_with_private_ip = var.private_ip
#	tags = {
#		environment = var.tags["env"]
#		createdBy = var.tags["createdBy"]
	
#	}	
#}

resource "aws_key_pair" "terraform_key" {
	key_name = "terraform-key"
	public_key = file("/home/fahim/.ssh/id_rsa.pub")
}
