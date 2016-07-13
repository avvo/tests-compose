FROM docker/compose:1.7.1
MAINTAINER Jeff Ching <jching@avvo.com>

ENV DOCKER_VERSION 1.11.0

RUN apk update && \
    apk add ca-certificates curl && \
    update-ca-certificates && \
    rm -f /var/cache/apk/*

RUN curl https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz | tar -zxv && \
    mv docker/* /usr/bin/

ADD run_test.sh /usr/bin/

WORKDIR /tmp
ENTRYPOINT run_test.sh
