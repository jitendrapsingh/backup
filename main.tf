resource "aws_backup_vault" "testvault" {
  name        = var.VAULT_NAME
  }


resource "aws_backup_plan" "plan1" {
  name = var.Plan_Name

  rule {
    rule_name         = var.Rule_Name
    target_vault_name = aws_backup_vault.testvault.name
    schedule          = "cron(0 12 * * ? *)"
  }

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "disabled"
    }
    resource_type = "EC2"
  }
}
