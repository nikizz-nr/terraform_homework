variable "region" {
    description = "Region to search for vpc"
}

variable "owner" {
    description = "Object owner for tag"
}

variable "db_user" {
    sensitive = true
    description = "Database username"
}

variable "db_password" {
    sensitive = true
    description = "Database password"
}
