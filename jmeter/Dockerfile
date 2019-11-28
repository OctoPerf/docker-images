FROM octoperf/java-ssh

ENV JMETER_VERSION 5.2.1
ENV JMETER_TGZ="apache-jmeter-$JMETER_VERSION.tgz"
ENV JMETER_DOWNLOAD_URL="https://archive.apache.org/dist/jmeter/binaries/$JMETER_TGZ" \
    JMETER_HOME="$HOME/apache-jmeter-$JMETER_VERSION" \
    OCTOPERF_PLUGIN_URL="https://github.com/OctoPerf/thread-group/releases/download/1.0.0/thread-group-1.0.0.jar" \
    CMDRUNNER_VERSION="2.2" \
    JMETER_PLUGINS="jpgc-casutg"

RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install bzip2 unzip tar curl dos2unix \
  && apt-get autoremove --purge -y \
  && apt-get autoclean \
  && rm -rf /var/lib/apt/lists/* \
  && curl -O $JMETER_DOWNLOAD_URL \
  && tar -xzvf $JMETER_TGZ \
  && rm $JMETER_TGZ \
  && rm -rf ${JMETER_HOME}/printable_docs ${JMETER_HOME}/docs ${JMETER_HOME}/licenses \
  && curl -L --show-error -o ${JMETER_HOME}/lib/ext/jmeter-plugins-manager.jar https://jmeter-plugins.org/get/ \
  && curl -L --show-error -o ${JMETER_HOME}/lib/cmdrunner-${CMDRUNNER_VERSION}.jar http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/${CMDRUNNER_VERSION}/cmdrunner-${CMDRUNNER_VERSION}.jar \
  && java -cp ${JMETER_HOME}/lib/ext/jmeter-plugins-manager.jar org.jmeterplugins.repository.PluginManagerCMDInstaller \
  && chmod +x ${JMETER_HOME}/bin/PluginsManagerCMD.sh \
  && ${JMETER_HOME}/bin/PluginsManagerCMD.sh install ${JMETER_PLUGINS} \
  && rm -f ${HOME}/jmeter.log \
  && rm -rf /tmp/pmgr_cache \
  && rm -f ${JMETER_HOME}/lib/jackson-* \
  && rm -f ${JMETER_HOME}/lib/error_prone* \
  && rm -f ${JMETER_HOME}/lib/checker-qual-* \
  && sed -i 's/append="false"/append="true"/' ${JMETER_HOME}/bin/log4j2.xml \
  && curl -L --show-error -o ${JMETER_HOME}/lib/ext/thread-group.jar $OCTOPERF_PLUGIN_URL \
  && chown -R octoperf:octoperf ${HOME}