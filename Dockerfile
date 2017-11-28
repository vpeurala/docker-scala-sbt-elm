FROM alpine:3.6

# Install needed apk packages

RUN apk update && \
  apk upgrade && \
  apk add \
  bash \
  ca-certificates \
  coreutils \
  curl \
  findutils \
  perl \
  tar

# Install Java
RUN apk add openjdk8
ENV PATH=$PATH:/usr/lib/jvm/default-jvm/bin/

# Install Scala & Sbt
RUN mkdir /downloads
WORKDIR /downloads
RUN curl --location --output /downloads/sbt-0.13.15.tgz --show-error --silent https://github.com/sbt/sbt/releases/download/v0.13.15/sbt-0.13.15.tgz
COPY sbt-0.13.15.tgz.sha256 /downloads
RUN sha256sum --check /downloads/sbt-0.13.15.tgz.sha256
RUN tar xf sbt-0.13.15.tgz
ENV PATH=$PATH:/downloads/sbt/bin
RUN sbt

# Install Elm



