output "rackula_url" {
  description = "Rackula web UI URL"
  value       = "http://${module.my_server_public.public_ip}:8080"
}

output "server_ip_public" {
  value = module.my_server_public.public_ip
}

output "ssm_command" {
  description = "AWS Session Manager command for the Rackula server"
  value       = "aws ssm start-session --target ${module.my_server_public.id}"
}
