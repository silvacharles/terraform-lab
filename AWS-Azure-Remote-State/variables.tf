variable "location" {
  description = "The location of the Azure Storage Account for remote state."
  type        = string
  default     = "West Europe"

}

variable "account_tier" {
  description = "The account tier of the Azure Storage Account for remote state."
  type        = string
  default     = "Standard"

}

variable "account_replication_type" {
  description = "The replication type of the Azure Storage Account for remote state."
  type        = string
  default     = "LRS"

}