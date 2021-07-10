###output Block ##############################3
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
             

