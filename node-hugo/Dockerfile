FROM node:10

MAINTAINER Gerald Pereira <gerald.pereira@octoperf.com>

ARG HUGO_VERSION=0.123.6
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb && \
  dpkg -i hugo_extended_${HUGO_VERSION}_linux-amd64.deb && \
  rm -f hugo_extended_${HUGO_VERSION}_linux-amd64.deb

VOLUME ["/src"]
WORKDIR /src

EXPOSE 3000