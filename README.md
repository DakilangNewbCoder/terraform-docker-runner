# terraform-docker-runner
A simple DevOps Tool to execute your Terraform Repo via Docker Container

## Build the image

Using hashicorp/terraform:1.5.7 image

```
docker build -t terraform:1.5.7-workspace .
```

## Use the terraform-playbook script under tools

>cd tools
>
>terraform-playbook [action] [git repo url] [git branch] [git directory name]

e.g.
```
terraform-playbook validate https://github.com/myrepo/myawesometerraform.git main my_awesome_terraform
```
