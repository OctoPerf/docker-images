FROM octoperf/java

COPY pom.xml ${HOME}/pom.xml

ARG MAVEN_VERSION=3.8.6         
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && echo "Downloading maven" \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  \
  && echo "Unziping maven" \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  \
  && echo "Cleaning and setting links" \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# Define environmental variables required by Maven, like Maven_Home directory and where the maven repo is located
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$ROOT_DIR/.m2"

RUN mvn --version \
    && mvn exec:java -f ${HOME}/pom.xml -e -Dexec.mainClass=com.microsoft.playwright.CLI -Dexec.args="install-deps" \
    && mvn exec:java -f ${HOME}/pom.xml -e -Dexec.mainClass=com.microsoft.playwright.CLI -Dexec.args="install chromium" \
    && rm -f ${HOME}/pom.xml
