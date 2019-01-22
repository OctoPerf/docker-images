FROM ubuntu:18.10

RUN apt-get update -y \
    && apt-get -y --no-install-recommends install openjdk-11-jre \
    && apt-get -y autoremove --purge \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -g 1001 octoperf \
    && useradd -r -u 1001 -g octoperf octoperf \
    && echo 'octoperf:octoperf' | chpasswd \
    && mkdir -p /home/octoperf \
    && chown -R octoperf:octoperf /home/octoperf

USER octoperf

ENV HOME /home/octoperf

WORKDIR ${HOME}

CMD ["/bin/bash"]