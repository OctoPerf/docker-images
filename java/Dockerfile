FROM ubuntu:20.04

ENV OP_USER=octoperf \
    OP_GROUP=octoperf \
    OP_USERID=9001 \
    OP_GID=9001 \
    HOME=/home/octoperf \
    JAVA_VERSION=17

RUN set -eux \
    && apt-get update -y \
    && apt-get -y --no-install-recommends install openjdk-${JAVA_VERSION}-jre gosu locales curl \
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
