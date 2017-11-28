FROM alpine:3.6

# Install needed apk packages

RUN apk update && \
  apk upgrade && \
  apk add \
  bash \
  curl \
  ca-certificates \
  tar

# Install Java
RUN apk add openjdk8
ENV PATH=$PATH:/usr/lib/jvm/default-jvm/bin/

# Install Scala & Sbt
RUN curl --location --output sbt-0.13.15.tgz --verbose https://github.com/sbt/sbt/releases/download/v0.13.15/sbt-0.13.15.tgz

# Install Elm



