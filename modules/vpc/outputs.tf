output "public_subnet_id1" {
    value = aws_subnet.public1.id
}
output "public_subnet_id2" {
    value = aws_subnet.public2.id
}
output "private_subnet_id3" {
  value = aws_subnet.private1.id
}
output "private_subnet_id4" {
  value = aws_subnet.private2.id
}
output "dev-vpc" {
  value = module.vpc.vpc_id
}