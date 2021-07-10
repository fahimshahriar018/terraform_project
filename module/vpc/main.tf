
resource "aws_vpc" "terraform-vpc" {
	cidr_block = var.vpc_cidr
	tags = {
		environment = var.tags["env"]
		createdBy = var.tags["createdBy"]
	}
}

resource "aws_subnet" "terraform-public-subnet" {
	vpc_id = aws_vpc.terraform-vpc.id
	cidr_block = var.public_subnet_cidr_block
	availability_zone = "${var.region}a"
	tags = {
		
		environment = var.tags["env"]
		createdBy = var.tags["createdBy"]
	}
}

resource "aws_subnet" "terraform-private-subnet" {
	vpc_id = aws_vpc.terraform-vpc.id
	cidr_block = var.private_subnet_cidr_block
	availability_zone = "${var.region}b"
	tags = {	
		environment = var.tags["env"]
		createdBy = var.tags["createdBy"]
	}
}

# create vpc internet gateway
resource "aws_internet_gateway" "terraform-igw" {
	
	vpc_id = aws_vpc.terraform-vpc.id
	
	tags = {	
		environment = var.tags["env"]
		createdBy = var.tags["createdBy"]
	}
}

#Create a routing table to accept internet access to public subnet
resource "aws_route_table" "terraform-public-rt" {
	vpc_id = aws_vpc.terraform-vpc.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.terraform-igw.id
	}
	
	tags = {

		environment = var.tags["env"]
		createdBy = var.tags["createdBy"]
	}
}

# associcate public routing table to public subnet 
resource "aws_route_table_association" "terraform_rt_association" {
	subnet_id = aws_subnet.terraform-public-subnet.id	
	route_table_id = aws_route_table.terraform-public-rt.id
}


