FROM ubuntu:focal
MAINTAINER Christian Bayle <christian.bayle@orange.com>

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        devscripts \
        build-essential \
        dh-make \
        lsb-release \
        fakeroot ubuntu-keyring lintian sudo \
        curl gnupg \
    && apt-get clean

COPY apt-add-gitlab /usr/bin/
RUN apt-add-gitlab Orange-OpenSource/gitlab-buildpkg-tools \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq gitlab-buildpkg-tools apt-add-gitlab \
    && apt-get clean 

RUN rm -f /etc/apt/apt.conf.d/docker-clean

