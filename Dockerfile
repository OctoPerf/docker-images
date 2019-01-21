FROM ubuntu:18.10

RUN groupadd -g 1001 octoperf \
    && useradd -r -u 1001 -g octoperf octoperf \
    && mkdir -p /home/octoperf \
    && chown -R octoperf:octoperf /home/octoperf

USER octoperf

ENV HOME /home/octoperf

WORKDIR $HOME

CMD ["/bin/bash"]
