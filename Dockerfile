FROM alpine:3.4

RUN apk --update add python py-setuptools py-pip && \
    pip install elasticsearch-curator==4.2.1 && \
    apk del py-pip && \
    rm -rf /var/cache/apk/*

COPY action.yml /etc/curator/action.yml

ENTRYPOINT ["/usr/bin/curator", "/etc/curator/action.yml"]
