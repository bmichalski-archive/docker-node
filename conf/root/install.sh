ESCAPED_NODE_VERSION=$(echo 0.12.2 | sed -rn 's/\./\\./pg') && \
SED_ARG="s/^<.*>v($ESCAPED_NODE_VERSION.*)\/<\/.*>.*/\1/p" && \
NODE_VERSION=`wget -O- -q http://nodejs.org/dist/ | sed -rn $SED_ARG` && \
SED_ARG="s/^<.*>(node-v$ESCAPED_NODE_VERSION-linux-x64\.tar\.gz)<\/.*>.*/\1/p" && \
ARCHIVE=`wget -O- -q http://nodejs.org/dist/v$NODE_VERSION | sed -rn $SED_ARG` && \
wget http://nodejs.org/dist/v$NODE_VERSION/$ARCHIVE && \
mkdir -p /opt/node && \
tar -xf $ARCHIVE -C /opt/node && \
SED_ARG="s/^(node-v$ESCAPED_NODE_VERSION-linux-x64)\.tar\.gz/\1/p" && \
NODE_FOLDER=/opt/node/`echo $ARCHIVE | sed -rn $SED_ARG` && \
ln -s $NODE_FOLDER /opt/node/node && \
echo "export PATH=$PATH:/opt/node/node/bin" >> /root/.profile && \
echo "export PATH=$PATH:/opt/node/node/bin" >> /home/r/.profile
