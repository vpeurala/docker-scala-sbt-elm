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

# Install Scala

# Install Sbt

# Install Elm



