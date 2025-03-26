# VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.prefix}-vpc"
  cidr = "10.0.0.0/16"

  azs             = var.azs
  public_subnets  = ["10.0.101.0/24"]

  default_security_group_ingress = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 25
      to_port     = 25
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 122
      to_port     = 122
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 8443
      to_port     = 8443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 9418
      to_port     = 9418
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 161
      to_port     = 161
      protocol    = "udp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 1194
      to_port     = 1194
      protocol    = "udp"
      cidr_blocks = "0.0.0.0/0"
    },
    # add a rule to allow all traffic from the security group
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      self        = true
    }
  ]

  default_security_group_egress = [ 
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
   ]

  default_security_group_name = "${var.prefix}-default-sg"

  tags = {
    owner = "${var.owner}"
  }
}

# GHES frontend1 node
module "frontend1" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.prefix}-frontend1"
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name

  vpc_security_group_ids = ["${module.vpc.default_security_group_id}"]
  subnet_id = "${module.vpc.public_subnets[0]}"
  ebs_optimized = true
  create_eip    =  true

  ebs_block_device = [
    {
      device_name = "/dev/sda1"
      volume_size = 500
      volume_type = "gp3"
      delete_on_termination = true
    },
    {
      device_name = "/dev/xvdb"
      volume_size = 800
      volume_type = "gp3"
      delete_on_termination = true
    }
  ]

  tags = {
    owner = "${var.owner}"
  }
}

# GHES frontend2 node
module "frontend2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.prefix}-frontend2"
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name

  vpc_security_group_ids = ["${module.vpc.default_security_group_id}"]
  subnet_id = "${module.vpc.public_subnets[0]}"
  ebs_optimized = true
  associate_public_ip_address = true

  ebs_block_device = [
    {
      device_name = "/dev/sda1"
      volume_size = 500
      volume_type = "gp3"
      delete_on_termination = true
    },
    {
      device_name = "/dev/xvdb"
      volume_size = 800
      volume_type = "gp3"
      delete_on_termination = true
    }
  ]

  tags = {
    owner = "${var.owner}"
  }
}

# GHES backtend1 node
module "backend1" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.prefix}-backend1"
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name

  vpc_security_group_ids = ["${module.vpc.default_security_group_id}"]
  subnet_id = "${module.vpc.public_subnets[0]}"
  ebs_optimized = true
  associate_public_ip_address = true

  ebs_block_device = [
    {
      device_name = "/dev/sda1"
      volume_size = 500
      volume_type = "gp3"
      delete_on_termination = true
    },
    {
      device_name = "/dev/xvdb"
      volume_size = 800
      volume_type = "gp3"
      delete_on_termination = true
    }
  ]

  tags = {
    owner = "${var.owner}"
  }
}

# GHES backend2 node
module "backend2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.prefix}-backend2"
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name

  vpc_security_group_ids = ["${module.vpc.default_security_group_id}"]
  subnet_id = "${module.vpc.public_subnets[0]}"
  ebs_optimized = true
  associate_public_ip_address = true

  ebs_block_device = [
    {
      device_name = "/dev/sda1"
      volume_size = 500
      volume_type = "gp3"
      delete_on_termination = true
    },
    {
      device_name = "/dev/xvdb"
      volume_size = 800
      volume_type = "gp3"
      delete_on_termination = true
    }
  ]

  tags = {
    owner = "${var.owner}"
  }
}

# GHES backend3 node
module "backend3" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.prefix}-backend3"
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name

  vpc_security_group_ids = ["${module.vpc.default_security_group_id}"]
  subnet_id = "${module.vpc.public_subnets[0]}"
  ebs_optimized = true
  associate_public_ip_address = true

  ebs_block_device = [
    {
      device_name = "/dev/sda1"
      volume_size = 500
      volume_type = "gp3"
      delete_on_termination = true
    },
    {
      device_name = "/dev/xvdb"
      volume_size = 800
      volume_type = "gp3"
      delete_on_termination = true
    }
  ]

  tags = {
    owner = "${var.owner}"
  }
}

# add a dns record for the elastic IP
resource "aws_route53_record" "dns" {
  zone_id = var.route53_zone_id
  name    = "${var.host_name}.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = ["${module.frontend1.public_ip}"]
}
