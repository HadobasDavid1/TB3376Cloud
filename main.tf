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

  answer_1 = regex("^answer_1\\s*=\\s*\"(.*)\"", local.answers)[0]
  answer_2 = regex("^answer_2\\s*=\\s*\"(.*)\"", local.answers)[0]
  answer_3 = regex("^answer_3\\s*=\\s*\"(.*)\"", local.answers)[0]
  answer_4 = regex("^answer_4\\s*=\\s*\"(.*)\"", local.answers)[0]
  answer_5 = regex("^answer_5\\s*=\\s*\"(.*)\"", local.answers)[0]
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
