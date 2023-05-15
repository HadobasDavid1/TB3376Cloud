variable "answer_1" {}
variable "answer_2" {}
variable "answer_3" {}
variable "answer_4" {}
variable "answer_5" {}

locals {
  answers = merge(
    var.answer_1 != null ? { answer_1 = var.answer_1 } : {},
    var.answer_2 != null ? { answer_2 = var.answer_2 } : {},
    var.answer_3 != null ? { answer_3 = var.answer_3 } : {},
    var.answer_4 != null ? { answer_4 = var.answer_4 } : {},
    var.answer_5 != null ? { answer_5 = var.answer_5 } : {},
  )
}

output "answers" {
  value = local.answers
}
