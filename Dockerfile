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
        py-pip \

    && rm -rf /var/cache/apk/* \
    && pip install --index-url=http://pypi.python.org/simple/ --trusted-host pypi.python.org Scrapy SQLAlchemy scrapy-redis

WORKDIR /runtime/app

COPY entrypoint.sh /runtime/entrypoint.sh
ENTRYPOINT ["/runtime/entrypoint.sh"]
CMD ["scrapy"]
