FROM octoperf/java

COPY pom.xml ${HOME}/pom.xml

RUN apt-get update -y && \
    apt-get install maven -y && \
    mvn --version && \
    mvn exec:java -f ${HOME}/pom.xml -e -Dexec.mainClass=com.microsoft.playwright.CLI -Dexec.args="install-deps" && \
    mvn exec:java -f ${HOME}/pom.xml -e -Dexec.mainClass=com.microsoft.playwright.CLI -Dexec.args="install chromium"