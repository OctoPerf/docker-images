FROM ruby

RUN gem install s3_website \
    && apt-get update \
    && apt-get install -y openjdk-7-jre-headless

VOLUME ["/website", "/config"]

WORKDIR /website

ENTRYPOINT ["s3_website"]

CMD ["--help"]
