variable "ports" {
  type = list(number)
}
variable "ami" {
  type = string
}
variable "ins_type" {
  type = string
}
variable "image_name" {
  type = string
}
variable "bucket_prefix" {
  type = string
  default = "my-s3bucket-"
}
variable "versioning" {
  type = bool
  default = true
}

}
