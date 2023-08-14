## Set the Account ID
locals {
    c = data.aws_caller_identity.current.account_id
}