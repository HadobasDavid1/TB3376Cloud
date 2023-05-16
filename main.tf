module "files" {
  source  = "./modules/files"
  content = "test"
  filename    = "filename"
}

module "read" {
  source          = "./modules/read"
  read_variable   = module.files.example_output
}
# locals {
#   answers = read("modules/write/answers.tfvars")
# }
# 
# module "write" {
#   source = "./modules/write"
# 
#   answer_1 = local.answers["answer_1"]
#   answer_2 = local.answers["answer_2"]
#   answer_3 = local.answers["answer_3"]
#   answer_4 = local.answers["answer_4"]
#   answer_5 = local.answers["answer_5"]
# }
# 
# module "data" {
#   source = "./modules/data"
#   file_path = module.files.file_path
# }
# 
# output "read_file_content" {
#   value = module.read.file_content
# }
# 
# output "write_answers" {
#   value = module.write.answers
# }
# 
# output "file_id" {
#   value = module.data.file_id
# }
