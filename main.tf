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
  source = "./modules/write"

  answer_1 = file("${path.module}/write/answers.tfvars").answer_1
  answer_2 = file("${path.module}/write/answers.tfvars").answer_2
  answer_3 = file("${path.module}/write/answers.tfvars").answer_3
  answer_4 = file("${path.module}/write/answers.tfvars").answer_4
  answer_5 = file("${path.module}/write/answers.tfvars").answer_5
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
