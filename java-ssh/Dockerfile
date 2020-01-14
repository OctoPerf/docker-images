FROM octoperf/java

RUN apt-get update -y \
  && apt-get -y --no-install-recommends install net-tools sysstat ssh \
  && apt-get autoremove --purge -y \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /var/run/sshd \
  && ssh-keygen -A \
  && service ssh reload