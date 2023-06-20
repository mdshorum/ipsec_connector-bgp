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
# To be used for name of IPSec connector but maybe combine with site name below for cloud connectors
variable "connectorname" {
  description = "Customer name"
  type        = string
}
# Adding endpoint name to use for IPSec connectors
variable "endpointname" {
  description = "Site name"
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
# Adding variable for auth key - not sure if null string will work - need to test
variable "bgpauthkey" {
  description = "Customer - BGP Auth Key"
  type        = string
  default     = ""
}
variable "gateway" {
  description = "Customer - Gateway"
  type        = string
}
# assuming same PSK for both tunnels - may need to update in future
variable "psk" {
  description = "Customer - PSK"
  type        = string
}
# variables to configure algos for customers who have specific requirements
variable "dhgroup" {
  description = "DH group for phase 1 & 2"
  type        = list(string)
  default     = ["MODP3072"]
}
variable "encryption" {
  description = "Encryption algorithm for phase 1 & 2"
  type        = list(string)
  default     = ["AES256CBC"]
}
variable "integrity" {
  description = "Integrity algorithm for phase 1 & 2"
  type        = list(string)
  default     = ["SHA256"]
}
