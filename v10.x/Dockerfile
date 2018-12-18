FROM amazonlinux:1

RUN yum install -y xz zip

COPY bootstrap bootstrap.js /opt/

ARG NODE_VERSION

RUN echo $NODE_VERSION

RUN curl -sSL https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz | \
  tar -xJ -C /opt --strip-components 1 -- node-v${NODE_VERSION}-linux-x64/bin/node

RUN cd /opt && \
  zip -yr /tmp/node-v${NODE_VERSION}.zip ./*
