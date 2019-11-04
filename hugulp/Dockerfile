FROM node:6

MAINTAINER Gerald Pereira <gerald.pereira@octoperf.com>

ENV HUGO_VERSION=0.59.1
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb && \
  dpkg -i hugo_${HUGO_VERSION}_Linux-64bit.deb && \
  rm -f hugo_${HUGO_VERSION}_Linux-64bit.deb

VOLUME ["/src"]
WORKDIR /src

EXPOSE 3000
