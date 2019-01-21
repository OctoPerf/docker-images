FROM octoperf/java

USER root

RUN apt-get update -y \
  && apt-get -y --no-install-recommends install net-tools sysstat ssh locales \
  && apt-get autoremove --purge -y \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /var/run/sshd \
  && service ssh reload \
  && locale-gen en_US.UTF-8

USER octoperf