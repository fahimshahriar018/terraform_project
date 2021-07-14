resource "aws_security_group_rule" "allow-ping" {
	type = "ingress"
	from_port = -1
	to_port = -1
	protocol = "icmp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = var.security_group_id	
}
