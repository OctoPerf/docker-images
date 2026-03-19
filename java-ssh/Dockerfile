FROM octoperf/java

RUN apt-get update -y \
  && apt-get -y --no-install-recommends install net-tools sysstat ssh fail2ban \
  && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
  && sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication no/' /etc/ssh/sshd_config && \
  && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
  && sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config && \
  && echo "AllowUsers octoperf" >> /etc/ssh/sshd_config \
  && apt-get autoremove --purge -y \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /var/run/sshd \
  && ssh-keygen -A \
  && service ssh reload
