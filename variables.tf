# Define variables
variable "db_name" {
  description = "The name of the WordPress database"
  type        = string
}

variable "db_username" {
  description = "The username for the WordPress database"
  type        = string
  sensitive = true
} 


variable "db_password" {
  sensitive = true
  description = "The password for the WordPress database"
  type        = string
}


variable "key_name" {
  description = "CLD_AWS_KEY"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24" 
}
