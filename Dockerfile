FROM hashicorp/terraform:1.5.7

USER root

COPY config/.gitconfig.template /root/.gitconfig.template
COPY config/.terraform.d/credentials.tfrc.json.template /root/.terraform.d/credentials.tfrc.json.template 
COPY scripts /root/scripts
RUN chmod -R +x /root/scripts

WORKDIR /workspace
ENTRYPOINT [ "sh" ]



