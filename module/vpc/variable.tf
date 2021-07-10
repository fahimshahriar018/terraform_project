variable "region" {
	type = string	
	description = "VPC Region"
	default = "us-east-1"
}


variable "vpc_cidr" {
	type = string
	default = "10.0.0.0/16"
} 

variable "tags" {
	type = map(string)
	description= "Resource tags"
	default = {
		env = "test"
		createdBy = "terraform"
	}
}

variable "public_subnet_count" {
	type = number
	default = 1
}


variable "private_subnet_count" {
	type = number
	default = 1
}

variable "subnet_az" {
	type = set(string)
	default = [
		"us-east-1a",
	        "us-east-1b",
		"us-east-1c"
	]
	description = "VPC Subnet availability zone"
}

variable "public_subnet_cidr_block" {
	type = string
	default = "10.0.1.0/24"
}

variable "private_subnet_cidr_block"{
	type = string
	default = "10.0.2.0/24"
}
