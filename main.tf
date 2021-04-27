resource "aws_iam_policy" "cloudconformity_1" {
  name= "cloudconformity_1"
  policy= data.aws_iam_policy_document.cloudconformity_1.json
}

resource "aws_iam_policy" "cloudconformity_2" { name   = "cloudconformity_2" policy = data.aws_iam_policy_document.cloudconformity_2.json
}

resource "aws_iam_role" "this" {
  name    = "cloudconformity"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          Effect : "Allow",
          Principal : {
            "AWS" : "arn:aws:iam::${local.conformity_account_id}:root"
          },
          Action : "sts:AssumeRole",
          Condition : {
            "StringEquals" : {
              "sts:ExternalId" : local.conformity_external_id
        }
      }
       }
    ]
    }
  )

  tags = var.tags
      }

resource "aws_iam_role_policy_attachment" "cloudconformity_1" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.cloudconformity_1.arn

      }

resource "aws_iam_role_policy_attachment" "cloudconformity_2" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.cloudconformity_2.arn
}