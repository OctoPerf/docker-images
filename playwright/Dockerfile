FROM octoperf/java

ARG MAVEN_VERSION=3.9.4 \
    TAG

ARG BASE_URL=https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    MAVEN_HOME=/usr/share/maven \
    MAVEN_CONFIG="${ROOT_DIR}/.m2"

COPY pom.xml ${HOME}/pom.xml

RUN set -eux \
  && mkdir -p /usr/share/maven /usr/share/maven/ref \
  && echo "Downloading maven" \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL} \
  \
  && echo "Unziping maven" \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  \
  && echo "Cleaning and setting links" \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn \
  && mvn --version \
  && mvn exec:java -f ${HOME}/pom.xml -e -Dexec.mainClass=com.microsoft.playwright.CLI -Dexec.args="install-deps" \
  && mvn exec:java -f ${HOME}/pom.xml -e -Dexec.mainClass=com.microsoft.playwright.CLI -Dexec.args="install chromium" \
  && rm -f ${HOME}/pom.xml
