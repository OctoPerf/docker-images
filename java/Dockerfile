FROM openjdk:11-jre-slim

ENV USER_ID=9001

RUN set -eux \
    && apt-get update -y \
    && apt-get -y --no-install-recommends install gosu locales \
    && gosu nobody true \
    && groupadd -g ${USER_ID} octoperf \
    && useradd -r -u ${USER_ID} -g octoperf octoperf \
    && echo 'octoperf:octoperf' | chpasswd \
    && mkdir -p /home/octoperf \
    && chown -R octoperf:octoperf /home/octoperf \
    && apt-get -y autoremove --purge \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    HOME=/home/octoperf

WORKDIR ${HOME}