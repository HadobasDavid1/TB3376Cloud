module "files" {
  source  = "./modules/files"
  content = "test"
  name    = "name"
}

module "read" {
  source = "./modules/read"
  file_name = module.files.file_name
}

module "write" {
  source = "./modules/write"
  answer_1 = module.read.read_file_content
  answer_2 = "tuple"
  answer_3 = "while"
  answer_4 = "using meta-argument"
  answer_5 = var.answers_file.answer_5
}

output "answers" {
  value = {
    "lifecycle_phase"        = module.write.answers.answer_1
    "invalid_attribute_type" = module.write.answers.answer_2
