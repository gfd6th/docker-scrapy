FROM alpine:latest

RUN apk -U add \
        gcc \
        libffi-dev \
        libxml2-dev \
        libxslt-dev \
        musl-dev \
        openssl-dev \
        python-dev \
        py-imaging \
        ca-certificates \
        py-pip \
        py-mysqldb \
        openssh-client\
        curl\
        screen\

    && rm -rf /var/cache/apk/* \
    && pip install Scrapy scrapy-redis awesome-slugify  requests-toolbelt rsa pyasn1 requests

WORKDIR /runtime/app

COPY entrypoint.sh /runtime/entrypoint.sh
ENTRYPOINT ["/runtime/entrypoint.sh"]
CMD ["scrapy"]
