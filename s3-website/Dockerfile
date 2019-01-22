FROM ubuntu:18.10

RUN apt-get update \
    && apt-get install -y --no-install-recommends ruby openjdk-8-jre-headless \
    && gem install s3_website \
    && apt autoremove -y --purge \
    && apt autoclean -y

VOLUME ["/website", "/config"]

WORKDIR /website

ENTRYPOINT ["s3_website"]

CMD ["--help"]
