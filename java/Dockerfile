FROM ubuntu:20.04

ENV USER_ID=9001 \
    JAVA_VERSION=11

RUN set -eux \
	&& apt-get update -y \
    && apt-get -y --no-install-recommends install openjdk-${JAVA_VERSION}-jre gosu locales curl \
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

CMD ["/bin/bash"]
