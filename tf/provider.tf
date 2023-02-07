provider "azurerm" {
  features {
    template_deployment {
      delete_nested_items_during_deletion = false
    }
  }
}

provider "databricks" {
  host                        = module.adb.databricks_workspace_host  
  azure_workspace_resource_id = module.adb.databricks_id

  # ARM_USE_MSI environment variable is recommended
  azure_use_msi = true
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.32"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.8.0"
    }
    http = {
      source = "hashicorp/http"
    }
  }

  backend "azurerm" {
		subscription_id      = "#{TF_VAR_SUBSCRIPTION_ID}#"
		resource_group_name  = "#{TF_VAR_STA_RSG_NAME}#"
		storage_account_name = "#{TF_VAR_STA_NAME}#"
		container_name       = "#{TF_VAR_STA_CONTAINER_NAME}#"
		key                  = "#{TF_VAR_STA_STATE_FILE}#"
	}
  required_version = "~> 1.3.2"
}