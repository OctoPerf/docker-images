FROM ubuntu:19.04

ENV USER_ID=9001

RUN set -eux \
	&& apt-get update -y \
    && apt-get -y --no-install-recommends install openjdk-11-jre gosu \
    && gosu nobody true \
    && groupadd -g ${USER_ID} octoperf \
    && useradd -r -u ${USER_ID} -g octoperf octoperf \
    && echo 'octoperf:octoperf' | chpasswd \
    && mkdir -p /home/octoperf \
    && chown -R octoperf:octoperf /home/octoperf \
    && apt-get -y autoremove --purge \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/*

ENV HOME /home/octoperf

WORKDIR ${HOME}

CMD ["/bin/bash"]
