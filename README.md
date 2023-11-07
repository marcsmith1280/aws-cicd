# AWS CICD Pipepline #

In this project we will build a self-deploying AWS CICD infrastructure pipeline through Terraform.
The pipeline will grab Terraform code from Github and apply it on AWS. 

The Project includes the code that defines the pipeline itself.
![Pipeline Diagram
](<![Alt text](image.png)>)

1. Github repo with main branch, will send notifications to the pipeline whenver changes happen to the branch
2. Pipeline triggers
3. Source stage downloads source code and puts in Pipeline S3 artifacts bucket
4. Code is then passed to Build phases:
5. CodeBuild "terraform plan" phase
6. CodeBuild "terraform apply" phase 


Step-by-step
1. Create Repo (github)
2. S3 Bucket to store TF State - versioning enable (cicd-pipeline-tf-state)
3. Dockerhub credentials to reliably download Terraform images - store in secrets manager. Used in codebuild phase to download images
-Username
-Password

Grab ARN of secret


4. Create codestar connection to link codepipeline and github


5. Create a dev environment (clone github locally)
using git clone 

6. Begin working on tf files
-terraform.tfvars
-state.tf
-variables.tf

After configuration run terraform init and terraform plan
Verify terraform.tfstate files is pushed to TF state S3 bucket

7. Begin working on the creating the pipeline, Include resource documentation from Terraform

- create S3 bucket to store Pipeline Artifacts in (s3.tf). Artifacts are the files that are worked on by actions in the pipeline. 
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

- Create the pipeline itself (pipeline.tf)
- Create a role that the pipeline can use to execute (iam.tf)
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role

8. Plan Phase is a Codebuild project and it will launch a Terraform docker image to run Terraform plan, output will be visible then we can decide it we want to approve
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project

# aws-cicd
