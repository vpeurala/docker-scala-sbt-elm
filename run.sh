#!/usr/bin/env bash
docker stop docker-scala-sbt-elm || true
docker rm docker-scala-sbt-elm || true
docker run --detach --interactive --name=docker-scala-sbt-elm --tty vpeurala/docker-scala-sbt-elm
