
resource "aws_vpc" "terraform-vpc" {
	cidr_block = "10.0.0.0/16"
	tags = {
		name = "terraform-vpc"
		createdBy = "terraform"
	}
}

resource "aws_subnet" "terraform-public-subnet" {
	vpc_id = aws_vpc.terraform-vpc.id
	cidr_block = "10.0.1.0/24"
	availability_zone = "us-east-1a"
	tags = {
		name = "terraform_public_subnet"
		createdBy = "terraform"
	}
}

resource "aws_subnet" "terraform-private-subnet" {
	vpc_id = aws_vpc.terraform-vpc.id
	cidr_block = "10.0.2.0/24"
	availability_zone = "us-east-1b"
	tags = {
		name = "terraform_private_subnet"
		createdBy = "terraform"
	}
}

# create vpc internet gateway
resource "aws_internet_gateway" "terraform-igw" {
	
	vpc_id = aws_vpc.terraform-vpc.id
	
	tags = {
		name = "terraform_internet_gateway"
		createdBy = "terraform"
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
		name = "terraform_public_routing_table"
		createdBy = "terraform"
	}
}

# associcate public routing table to public subnet 
resource "aws_route_table_association" "terraform_rt_association" {
	subnet_id = aws_subnet.terraform-public-subnet.id	
	route_table_id = aws_route_table.terraform-public-rt.id
}


################### Output Block ##############################3
output "vpc-id" {
	value = aws_vpc.terraform-vpc.id
	description = "VPC ID  "
}


output "public-subnet-id" {
	value = aws_subnet.terraform-public-subnet.id
	description = "Public Subnet ID  "
}


output "private-subnet-id" {
	value = aws_subnet.terraform-private-subnet.id
	description = "Private subnet "
}

output "vpc-igw-id" {
	value = aws_internet_gateway.terraform-igw.id
	description = "VPC Internet Gateway ID "
}


output "vpc-public-rt-id" {
	value = aws_route_table.terraform-public-rt.id
	description = "VPC Public Routing table ID "
}
