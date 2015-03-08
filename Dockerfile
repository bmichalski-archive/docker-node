FROM bmichalski/base

COPY conf/root/install.sh /root/install.sh

RUN chmod u+x /root/install.sh

RUN \
  base/configure.sh && \
  apt-get install -y \
    wget \
  && \
  adduser --disabled-password --gecos '' r && \
  adduser r sudo && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
  /root/install.sh

ENV HOME /root

WORKDIR /root

CMD bash 
