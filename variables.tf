variable "owner" {
  description = "Owner of the resources"
  default     = "your-name"
  type        = string
  
}

variable "prefix" {
  description = "Prefix for all resources"
  default     = "your =prefix"
  type        = string
  
}

variable "region" {
  description = "AWS region to deploy resources in"
  default = "us-west-2"
  type        = string
}

variable "azs" {
  description = "Availability zones to use for the VPC"
  default     = ["us-west-2a"]
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  default     = "ami-0dbc527a78e6b9756" # GHES 3.15.4 in us-west-2
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair to use for the EC2 instance"
  default     = "your-key-name"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "m5a.2xlarge"
  type        = string
}

variable "route53_zone_id" {
  description = "Route53 zone ID for the DNS record"
  default     = "your-route53-zone-id"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the DNS record"
  default     = "your-domain-name"
  type        = string
}

variable "host_name" {
  description = "Host name for the DNS record"
  default     = "your-host-name"
  type        = string
}