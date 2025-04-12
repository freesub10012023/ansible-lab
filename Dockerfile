FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

COPY ./id_rsa.pub /root/.ssh/authorized_keys

RUN apt update && \
    apt install vim ssh -y && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
