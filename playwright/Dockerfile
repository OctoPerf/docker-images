FROM maven

COPY pom.xml ${HOME}/pom.xml

RUN mvn --version \
    && mvn exec:java -f ${HOME}/pom.xml -e -Dexec.mainClass=com.microsoft.playwright.CLI -Dexec.args="install-deps" \
    && mvn exec:java -f ${HOME}/pom.xml -e -Dexec.mainClass=com.microsoft.playwright.CLI -Dexec.args="install chromium" \
    && rm -f ${HOME}/pom.xml

FROM octoperf/java
