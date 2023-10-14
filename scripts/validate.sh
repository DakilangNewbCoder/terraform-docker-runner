#/bin/sh

#Set Token for terraform and git
cat /root/.gitconfig.template | sed  "s/GIT_TOKEN/${GIT_TOKEN}/g;s/GIT_NAME/${GIT_NAME}/g;s/GIT_EMAIL/${GIT_EMAIL}/g" > /root/.gitconfig
cat /root/.terraform.d/credentials.tfrc.json.template | sed "s/TF_TOKEN/${TF_TOKEN}/g" > /root/.terraform.d/credentials.tfrc.json

#Clone Script here
pwd
terraform version
git -v
echo "$(date): Cloning ${GIT_REPO}"
git clone $(echo ${GIT_REPO} | sed "s/\"//g") -b $(echo ${GIT_BRANCH} | sed "s/\"//g") $(echo ${GIT_DIR})
cd "${GIT_DIR}"
echo "$(date): Cloned ${GIT_REPO}"
unset GIT_TOKEN GIT_NAME GIT_EMAIL TF_TOKEN
echo "$(date): Starting Terraform validate"
terraform init && terraform fmt && terraform validate
echo "$(date): Task Completed... Goodbye!"

