FROM ubuntu:18.10

RUN groupadd -g 1001 octoperf \
    && useradd -r -u 1001 -g octoperf octoperf \
    && mkdir -p /home/octoperf \
    && chown -R octoperf:octoperf /home/octoperf \
    && apt-get update -y \
    && apt-get -y --no-install-recommends install openjdk-11-jre \
    && apt-get -y autoremove --purge \
    && apt-get -y autoclean

USER octoperf

ENV HOME /home/octoperf

WORKDIR $HOME

CMD ["/bin/bash"]
