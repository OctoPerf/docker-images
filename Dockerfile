FROM ubuntu:18.10

RUN groupadd -g 1001 octoperf \
    && useradd -r -u 1001 -g octoperf octoperf \
    && mkdir -p /home/octoperf \
    && chown -R octoperf:octoperf /home/octoperf

USER octoperf

RUN apt-get update -y \
  && apt-get -y --no-install-recommends install openjdk-11-jre
  && apt-get -y autoremove --purge \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

ENV HOME /home/octoperf

WORKDIR $HOME

CMD ["/bin/bash"]
