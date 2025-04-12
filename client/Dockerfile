FROM python

ENV DEBIAN_FRONTEND=noninteractive
ENV ANSIBLE_HOST_KEY_CHECKING=False

WORKDIR /opt/ansible_quickstart

COPY id_rsa /root/.ssh/id_rsa

RUN apt update && \
    apt install vim -y && \
    pip install ansible
