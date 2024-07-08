resource "aws_iam_group" "d-team" {
  name = "Dev-engineer"
}

resource "aws_iam_policy" "devops-policy" {
  name = "Devops"
  description = "Allow right for the dev-engineer group"

  policy = jsonencode({
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:DescribeInstances",
				"ec2:ListImagesInRecycleBin"
			],
			"Resource": "*"
		}
	]
})
}

resource "aws_iam_policy_attachment" "attach_policy_to_dev-engineer" {
  name = "attach_policy_to_dev-engineer"
  policy_arn = aws_iam_policy.devops-policy.arn
  groups = [aws_iam_group.d-team.name]
}
