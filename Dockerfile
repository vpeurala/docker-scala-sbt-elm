FROM alpine:3.6

ENV NODEJS_VERSION=8.9.1
ENV SBT_VERSION=0.13.15
ENV SCALA_VERSION=2.11.11

# Install needed apk packages
RUN apk update && \
  apk upgrade && \
  apk add \
  bash \
  binutils-gold \
  ca-certificates \
  coreutils \
  curl \
  findutils \
  g++ \
  gcc \
  gnupg \
  libstdc++ \
  linux-headers \
  make \
  openjdk8 \
  perl \
  python \
  tar

# Add Java to PATH
ENV PATH=$PATH:/usr/lib/jvm/default-jvm/bin/

# Create downloads directory with sha256 files
RUN mkdir /downloads
COPY sha256/* /downloads/

# Install Sbt && Scala
WORKDIR /downloads
RUN curl --location --remote-name --show-error --silent https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz && \
  curl --location --remote-name --show-error --silent https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz && \
  sha256sum --check sbt-${SBT_VERSION}.tgz.sha256 && \
  sha256sum --check scala-${SCALA_VERSION}.tgz.sha256 && \
  tar xf sbt-${SBT_VERSION}.tgz && \
  tar xf scala-${SCALA_VERSION}.tgz
ENV SBT_HOME=/downloads/sbt
ENV PATH=$PATH:${SBT_HOME}/bin
ENV SCALA_HOME=/downloads/scala-${SCALA_VERSION}
ENV PATH=$PATH:${SCALA_HOME}/bin

# Install NodeJS 8.9.1
WORKDIR /downloads
RUN curl --location --remote-name --show-error --silent https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz && \
  sha256sum --check node-v${NODEJS_VERSION}-linux-x64.tar.gz.sha256 && \
  tar xf node-v${NODEJS_VERSION}-linux-x64.tar.gz
RUN curl --location --remote-name --show-error --silent https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz && \
  sha256sum --check node-v${NODEJS_VERSION}.tar.gz.sha256 && \
  tar xf node-v${NODEJS_VERSION}.tar.gz && \
  cd node-v${NODEJS_VERSION} && \
  ./configure --fully-static && \
  make && \
  make install

# Install Elm
RUN npm install -g elm

# Fill the caches
COPY warmup /warmup
WORKDIR /warmup
RUN mkdir -p /root/.ivy2/local
RUN cp -R /downloads/sbt/lib/local-preloaded/* /root/.ivy2/local/
RUN sbt update
RUN elm-package install
