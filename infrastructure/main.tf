module "vpc" {
  source = "./modules/vpc"
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "ecs" {
  source                = "./modules/ecs"
  image_url             = "PUT YOUR image URL here e.g 717279702591.dkr.ecr.eu-north-1.amazonaws.com/smarttask-backend:latest"
  subnet_id             = module.vpc.public_subnet_ids
  alb_security_group_id = module.alb.alb_security_group_id
  target_group_arn      = module.alb.target_group_arn
  security_group_id     = module.ecs.ecs_security_group_id
  vpc_id                = module.vpc.vpc_id

  depends_on = [module.alb]
}

module "https" {
  source           = "./modules/https"
  domain_name      = var.domain_name
  alb_arn          = module.alb.app_alb_arn
  alb_dns_name     = module.alb.app_alb_dns_name
  alb_zone_id      = module.alb.app_alb_zone_id
  target_group_arn = module.alb.target_group_arn
  zone_id          = data.aws_route53_zone.primary.zone_id

  depends_on = [module.alb]
}

module "s3" {
  source              = "./modules/s3"
  bucket_name         = var.bucket_name
  domain_name         = var.domain_name
  acm_certificate_arn = module.https.https_certificate_arn
}

module "route53" {
  source         = "./modules/route53"
  domain_name    = var.domain_name
  alb_dns_name   = module.alb.app_alb_dns_name
  alb_zone_id    = module.alb.app_alb_zone_id
}

module "rds" {
  source                = "./modules/rds"
  allocated_storage     = 20
  instance_class        = "db.t3.micro"
  db_name               = "smarttasktracker"
  db_username           = "smartuser"
  db_password           = "smartpassword"
  publicly_accessible   = false
  private_subnet_ids    = module.vpc.private_subnet_ids
  rds_security_group_id = module.vpc.rds_sg_id
}

data "aws_route53_zone" "primary" {
  name         = var.domain_name
  private_zone = false
}

output "certificate_arn" {
  value = module.https.https_certificate_arn
}

output "https_listener" {
  value = module.https.https_listener_arn
}
