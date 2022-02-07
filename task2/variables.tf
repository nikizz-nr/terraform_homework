variable "region" {
    description = "Region to search for vpc"
}

variable "owner" {
    description = "Object owner for tag"
}

# variable "subnet_list" {
#     description = "Subnet list name"
#     type = list
# }

variable "db_user" {
    sensitive = true
    description = "Database username"
}

variable "db_password" {
    sensitive = true
    description = "Database password"
}
