FROM node:10

MAINTAINER Gerald Pereira <gerald.pereira@octoperf.com>

ENV HUGO_VERSION=0.78.2
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.deb && \
  dpkg -i hugo_extended_${HUGO_VERSION}_Linux-64bit.deb && \
  rm -f hugo_extended_${HUGO_VERSION}_Linux-64bit.deb

VOLUME ["/src"]
WORKDIR /src

EXPOSE 3000
