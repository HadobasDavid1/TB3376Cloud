module "files" {
  source  = "./modules/files"
  content = "test"
  filename    = "filename"
}

module "read" {
  source        = "./modules/read"
  read_variable = tostring(module.files.example_output[0])
}

output "final_output" {
  value = module.read.read_output
}
# DO NOT DELETE ANYTHING BEFORE THIS POINT
locals {
  answers = file("modules/write/answers.tfvars")
}

module "write" {
  source = "./modules/write"

  answer_1 = trim(split("=", split("\n", local.answers)[0])[1])
  answer_2 = trim(split("=", split("\n", local.answers)[1])[1])
  answer_3 = trim(split("=", split("\n", local.answers)[2])[1])
  answer_4 = trim(split("=", split("\n", local.answers)[3])[1])
  answer_5 = trim(split("=", split("\n", local.answers)[4])[1])
}
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
