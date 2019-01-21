FROM octoperf/java

ENV JMETER_VERSION 5.0
ENV JMETER_TGZ="apache-jmeter-$JMETER_VERSION.tgz"
ENV JMETER_DOWNLOAD_URL="https://mirror.ibcp.fr/pub/apache/jmeter/binaries/$JMETER_TGZ" \
    JMETER_DIR="$HOME/apache-jmeter-$JMETER_VERSION" \
    OCTOPERF_PLUGIN_URL="https://github.com/OctoPerf/thread-group/releases/download/1.0.0/thread-group-1.0.0.jar" \
    JMETER_PLUGINS_MANAGER_VERSION="1.3" \
    CMDRUNNER_VERSION="2.2" \
    JMETER_PLUGINS="jpgc-casutg"

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
  && rm -rf ${JMETER_DIR}/printable_docs ${JMETER_DIR}/docs ${JMETER_DIR}/licenses ${JMETER_DIR}/extras \
  && curl --location --silent --show-error --output ${JMETER_DIR}/lib/ext/jmeter-plugins-manager-${JMETER_PLUGINS_MANAGER_VERSION}.jar http://search.maven.org/remotecontent?filepath=kg/apc/jmeter-plugins-manager/${JMETER_PLUGINS_MANAGER_VERSION}/jmeter-plugins-manager-${JMETER_PLUGINS_MANAGER_VERSION}.jar \
  && curl --location --silent --show-error --output ${JMETER_DIR}/lib/cmdrunner-${CMDRUNNER_VERSION}.jar http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/${CMDRUNNER_VERSION}/cmdrunner-${CMDRUNNER_VERSION}.jar \
  && java -cp ${JMETER_DIR}/lib/ext/jmeter-plugins-manager-${JMETER_PLUGINS_MANAGER_VERSION}.jar org.jmeterplugins.repository.PluginManagerCMDInstaller \
  && ${JMETER_DIR}/bin/PluginsManagerCMD.sh install ${JMETER_PLUGINS} \
  && curl --location --silent --show-error --output ${JMETER_DIR}/lib/ext/thread-group.jar $OCTOPERF_PLUGIN_URL
