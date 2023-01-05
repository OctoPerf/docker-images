FROM ubuntu:20.04

ENV OP_USER="octoperf" \
    OP_UID="9001" \
    OP_GID="9001"

ENV JAVA_VERSION=17

RUN set -eux \
    && apt-get update -y \
    && apt-get -y --no-install-recommends install openjdk-${JAVA_VERSION}-jre gosu locales curl \
    && gosu nobody true \
    && groupadd -g ${OP_GID} ${OP_USER} \
    && useradd -r -u ${OP_UID} -g ${OP_USER} ${OP_USER} \
    && echo "${OP_USER}:${OP_USER}" | chpasswd \
    && mkdir -p /home/${OP_USER} \
    && chown -R ${OP_USER}:root /home/${OP_USER} \
    && chmod -R 0775 /home/${OP_USER} \
    && apt-get -y autoremove --purge \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    HOME=/home/${OP_USER}

WORKDIR ${HOME}

CMD ["/bin/bash"]
