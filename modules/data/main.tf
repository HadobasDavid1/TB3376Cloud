data "local_file" "generated_file" {
  filename = var.file_path
}

output "file_id" {
  value = data.local_file.generated_file.id
}
