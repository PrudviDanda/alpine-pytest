FROM alpine:3.8

RUN apk add --update --no-cache --virtual build-dependencies \
    gcc \
    g++ \
    make \
    libffi-dev \
    openssl-dev \
    python3 \
    python3-dev \
    build-base \
    openssl \
    ca-certificates \
    netcat-openbsd \
    musl-dev \
    curl

RUN pip3 install --upgrade pip==18.1  && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

ENTRYPOINT ["/bin/sh"]
