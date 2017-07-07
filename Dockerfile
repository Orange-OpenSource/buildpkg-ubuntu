FROM ubuntu:latest
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

