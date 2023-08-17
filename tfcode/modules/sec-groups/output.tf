output "sec_group0_demo_staging_public" {
  value = aws_security_group.demo_staging_public.id
}

output "sec_group_demo_staging_private" {
  value = aws_security_group.demo_staging_private.id
}