module "files" {
  source  = "./modules/files"
  content = "test"
  name    = "name"
}

module "read" {
  source          = "./modules/read"
  read_variable   = module.files.example_output
}

module "write" {
  source    = "./modules/write"
  variables = read("modules/write/answers.tfvars")
}

locals {
  question_1 = module.write.variables.answer_1
  question_2 = module.write.variables.answer_2
  question_3 = module.write.variables.answer_3
  question_4 = module.write.variables.answer_4
  question_5 = module.write.variables.answer_5
}

module "data" {
  source = "./modules/data"
  file_path = module.files.file_path
}

output "read_file_content" {
  value = module.read.file_content
}

output "write_answers" {
  value = module.write.answers
}

output "file_id" {
  value = module.data.file_id
}
