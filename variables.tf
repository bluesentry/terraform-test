locals {
  conformity_account_id  = "1234567891012"
  conformity_external_id = "0x0xxx20-0101-11xx-11x8-x111xx0xx111"
  policy_attachments = [
    aws_iam_policy.cloudconformity_1.arn,
    aws_iam_policy.cloudconformity_2.arn,
  ]
}
variable "tags" {}
