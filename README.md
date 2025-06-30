# ☁️ SmartTaskTracker – 3-Tier AWS Web App Infrastructure

This project provisions a full 3-tier architecture for a task-tracking web application using **Terraform** on **AWS**. It separates the **frontend**, **backend**, and **database** layers, ensuring a scalable, secure, and production-ready setup.

---
## 🖼 Screenshots

### 🔐 Login Page

![Login Page](assets/screenshot1.png)

### 📋 Dashboard

![Dashboard](assets/dashboard.png)

## 🚀 Features

- **Modular Terraform structure** for reusable infrastructure components
- **ECS Fargate** backend cluster running Node.js server (`server.js`)
- **ALB (Application Load Balancer)** with HTTPS and Route53 DNS
- **S3 static frontend hosting** (`index.html`, `login.html`, etc.)
- **PostgreSQL RDS** for data persistence
- **ACM certificate validation** with automatic DNS records
- **Route53** domain management with `hasnatur-devops.com`
- **Secure networking** using VPC, public/private subnets, and security groups

---

## 🧱 Infrastructure Stack

| Layer     | AWS Service                  | Description                                  |
|-----------|------------------------------|----------------------------------------------|
| Frontend  | S3 + Route53                 | Static site hosted on S3 via custom domain   |
| Backend   | ECS Fargate + ALB            | Node.js app served via HTTPS                 |
| Database  | RDS (PostgreSQL)             | Managed database with private access         |
| Network   | VPC, Subnets, SGs            | Isolated and secure networking               |
| TLS       | ACM + Route53                | SSL certificate auto-validation via DNS      |
| CDN (opt) | (Optional) CloudFront        | Can be removed if not using CDN              |

---

## 🌐 Domain

This app is deployed on: https://hasnatur-devops.com

DNS records are managed via Route53, pointing the root domain to the ALB and S3 where appropriate.

---

## 🗂 Project Structure

```text
.
├── main.tf                # Root Terraform entry point
├── terraform.tfvars       # Variables file (e.g., domain_name, alb_arn)
├── modules/
│   ├── vpc/               # VPC, subnets, route tables
│   ├── alb/               # ALB and Target Group
│   ├── ecs/               # ECS Cluster, Task Definition, Service
│   ├── s3/                # S3 bucket + policy + file uploads
│   ├── rds/               # RDS PostgreSQL instance
│   ├── https/             # ACM cert + HTTPS listener
│   └── route53/           # DNS alias records
└── public/
    └── *.html             # Frontend static files
```
# 📦 Backend Application
Your backend runs in Docker on Fargate. It serves static HTML and Node.js API routes.

.env sample:

```ini
PORT=3000
JWT_SECRET=******
DATABASE_URL=******
```

# 🛠 Usage
Install dependencies:

```bash
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```
## Upload frontend files:

```bash
aws s3 sync ./public s3://smarttask-frontend-hasnat --delete
```
## Verify domain setup:

```bash
dig hasnatur-devops.com +short
```

## Deploy backend Docker image to ECR
Make sure your image is available at:

```bash
Your image URL e.g 717279702591.dkr.ecr.eu-north-1.amazonaws.com/smarttask-backend:latest
```
# 🧪 Troubleshooting
DNS_PROBE_POSSIBLE: Ensure Route53 alias record points to ALB.

CannotPullContainerError: Double-check the ECR image URI.

Email already exists: Clear your PostgreSQL table or inspect users table.

AccessDenied on S3: Ensure public ACLs are disabled and bucket policy is correct.

ACM Certificate hangs: DNS validation record may be missing or not propagated.

# 🧑‍💻 Author
Built by Hasnat for full-stack DevOps learning and deployment practice.

📜 License
MIT © 2025 Hasnat

```yaml
Let me know if you’d like to auto-generate badges, add screenshots, or include a deployment diagram!
```
