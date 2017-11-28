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

# Install Scala

# Install Sbt

# Install Elm



