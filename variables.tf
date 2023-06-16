variable "alk_portal" {
  description = "Alkira (CSX) - portal)"
  type        = string
  sensitive   = true
}

variable "alk_username" {
  description = "Alkira - user"
  type        = string
  sensitive   = true
}

variable "alk_password" {
  description = "Alkira - password"
  type        = string
  sensitive   = true
}

variable "name" {
  description = "Customer name"
  type        = string
}

variable "alk_segment" {
  description = "Alkira - segment"
  type        = string
  default     = "business"
}

variable "alk_group" {
  description = "Alkira - group"
  type        = string
  default     = "CUSTOMER"
}

variable "cxp" {
  description = "Alkira - CXP"
  type        = string
}

variable "size" {
  description = "Alkira - size"
  type        = string
}

variable "asn" {
  description = "Customer - ASN"
  type        = string
}

variable "gateway" {
  description = "Customer - Gateway"
  type        = string
}

variable "psk" {
  description = "Customer - PSK"
  type        = string
}
