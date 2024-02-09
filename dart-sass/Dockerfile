FROM google/dart

MAINTAINER Gerald Pereira <gerald.pereira@octoperf.com>

RUN apt-get update --allow-insecure-repositories
RUN apt-get install --no-install-recommends -y wget tar
RUN wget https://github.com/sass/dart-sass/releases/download/1.69.7/dart-sass-1.69.7-linux-x64.tar.gz -O dart-sass.tar.gz
RUN tar -xvf dart-sass.tar.gz -C /opt/

WORKDIR /opt/dart-sass
ENTRYPOINT ["/opt/dart-sass/sass", "/css"]