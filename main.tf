resource "aws_backup_vault" "testvault" {
  name        = "vault1"
  }


resource "aws_backup_plan" "plan1" {
  name = "plan1"

  rule {
    rule_name         = "Rul1"
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
