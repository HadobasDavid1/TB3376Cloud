module "files" {
  source  = "./modules/files"
  content = "test"
  name    = "name"
}

module "read" {
  source = "./modules/read"
  file_content = module.files.content
}

module "write" {
  source = "./modules/write"
  answer_1 = "string"
  answer_2 = "object"
  answer_3 = "while"
  answer_4 = "using meta-argument"
  answer_5 = "using -var flag"
  answers_file_path = "./modules/write/answers.tfvars"
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
