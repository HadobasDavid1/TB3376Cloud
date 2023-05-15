module "files" {
  source = "./modules/files"
  file_path = "/path/to/file"
}

module "read" {
  source = "./modules/read"
  file_name = module.files.file_name
}
