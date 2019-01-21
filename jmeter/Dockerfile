FROM octoperf/java

ENV JMETER_VERSION 5.0
ENV JMETER_TGZ="apache-jmeter-$JMETER_VERSION.tar.gz"
ENV JMETER_DOWNLOAD_URL="http://apache.crihan.fr/dist//jmeter/binaries/$JMETER_TGZ" \
    JMETER_DIR="$HOME/apache-jmeter-$JMETER_VERSION" \
    OCTOPERF_PLUGIN_URL="https://github.com/OctoPerf/thread-group/releases/download/1.0.0/thread-group-1.0.0.jar"

USER root

RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install bzip2 unzip tar curl \
  && apt-get autoremove --purge -y \
  && apt-get autoclean \
  && rm -rf /var/lib/apt/lists/*

USER octoperf

RUN curl -O $JMETER_DOWNLOAD_URL \
  && tar -xzvf $JMETER_TGZ \
  && rm $JMETER_TGZ \
  && cd $JMETER_DIR/lib/ext \
  && curl -O $OCTOPERF_PLUGIN_URL
