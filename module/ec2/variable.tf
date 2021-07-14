variable "region" {

	type = string
	default = "us-east-1"
	description = "Region of the instacne"
}

variable "instance_type" {

	type = string
	default = "t2.micro"
	description = "Type of the instance"
}

variable "tags" {
	type = map(string)
	default = {
		env = "test"
		createdBy = "terraform"
	}

}
variable "private_ip" {
	type =  list
	default = ["10.0.1.100"]
	description = "Private ip of the instance"
}

variable "subnet_id" {

	type = string
	description = "Subnet id of VPC where instance will be deployed"
	default = "subnet-0798f96cb95d4766c"

}
variable "root_volume_type" {
	type = string
	description = "root volume  type"
	default = "gp2"
	
}

variable "root_volume_size" {
	type = number
	description = "size of ebs volume in GiB"
	default = 8
}
variable "root_disk_delete" {
	type = bool
	description = "choose whether volume will be destroyed or not while terraform destroy the infrastructure"
	default = "true"
}

variable "security_group_id" {
	type = string
	default = "sg-0d98bc7c80296d771"
	description = "VPC Security Group id"
}
