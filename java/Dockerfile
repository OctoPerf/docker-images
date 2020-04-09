FROM openjdk:11-jre-slim

ENV USER_ID=9001 \
    HOME=/home/octoperf

RUN set -eux \
    && apt-get update -y \
    && apt-get -y --no-install-recommends install gosu \
    && gosu nobody true \
    && groupadd -g ${USER_ID} octoperf \
    && useradd -r -u ${USER_ID} -g octoperf octoperf \
    && echo 'octoperf:octoperf' | chpasswd \
    && mkdir -p /home/octoperf \
    && chown -R octoperf:octoperf /home/octoperf \
    && apt-get -y autoremove --purge \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR ${HOME}
