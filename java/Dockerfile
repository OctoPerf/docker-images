# The JDK line picks the Ubuntu release (see the Makefile): jdk21 stays on 24.04, jdk25 moves to 26.04.
ARG UBUNTU_VERSION=26.04
FROM ubuntu:${UBUNTU_VERSION}

# JDK line of the image: 21 or 25, see the jdk<N> tags built by the Makefile
ARG JAVA_VERSION=25

ENV OP_USER=octoperf \
    OP_GROUP=octoperf \
    OP_USERID=9001 \
    OP_GID=9001 \
    HOME=/home/octoperf \
    JAVA_VERSION=${JAVA_VERSION}

RUN set -eux \
    && apt-get update -y \
    && apt-get -y --no-install-recommends install openjdk-${JAVA_VERSION}-jdk gosu locales curl lsof \
    && gosu nobody true \
    && groupadd -g ${OP_GID} ${OP_GROUP} \
    && useradd -r -u ${OP_USERID} -g ${OP_GROUP} -G root ${OP_USER} \
    && echo "${OP_USER}:${OP_USER}" | chpasswd \
    && mkdir -p ${HOME} \
    && chown -R ${OP_USER}:root ${HOME} \
    && chmod -R 0775 ${HOME} \
    && apt-get -y autoremove --purge \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

WORKDIR ${HOME}

CMD ["/bin/bash"]
