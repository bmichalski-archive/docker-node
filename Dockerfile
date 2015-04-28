FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get install -y \
    wget

RUN \
  adduser --disabled-password --gecos '' r && \
  adduser r sudo && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY conf/root/install.sh /root/install.sh

RUN \
  chmod u+x /root/install.sh

RUN \
  /root/install.sh

ENV HOME /root

WORKDIR /root

CMD bash 
