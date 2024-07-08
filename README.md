# Host Portfolio Website on AWS S3 using Terraform

This project outlines the steps to host a static portfolio website on Amazon S3 using Terraform. The portfolio website can include your resume, projects, blog, and contact information.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Terraform Configuration](#terraform-configuration)
- [Deploy](#deploy)
- [Configuring the S3 Bucket for Static Website Hosting](#configuring-the-s3-bucket-for-static-website-hosting)
- [Setting Up Permissions](#setting-up-permissions)
- [Accessing the Website](#accessing-the-website)
- [Conclusion](#conclusion)
- [License](#license)

## Prerequisites

Before you begin, make sure you have the following:

- An AWS account
- AWS CLI installed and configured on your local machine
- Terraform installed on your local machine
- Basic understanding of HTML, CSS, and JavaScript
- A static website ready to be hosted (HTML, CSS)

## Setup

1. **Create a New Directory for Your Project**

    ```bash
    mkdir my-portfolio-website
    cd my-portfolio-website
    ```

2. **Initialize a New Terraform Configuration**

    ```bash
    terraform init
    ```

## Terraform Configuration


https://registry.terraform.io/providers/hashicorp/aws/latest/docs

After deploying the configuration, you can access your website using the URL output by Terraform:

