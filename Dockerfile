FROM ubuntu:14.04

COPY conf/root/install.sh /root/install.sh

RUN chmod u+x /root/install.sh

RUN \
  echo "`/sbin/ip route|awk '/default/ { print $3 }'` dockerhost" >> /etc/hosts && \
  echo 'Acquire::http { Proxy "http://dockerhost:3142"; };' >> /etc/apt/apt.conf.d/01proxy && \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y \
    software-properties-common \
    vim \
    curl \
    wget \
  && \
  adduser --disabled-password --gecos '' r && \
  adduser r sudo && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
  bash /root/install.sh

ENV HOME /root

WORKDIR /root

CMD ["bash", "-c", "su - r"]
