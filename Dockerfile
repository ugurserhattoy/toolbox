FROM alpine

RUN apk update && apk upgrade --no-cache

RUN apk add --no-cache \
    curl \
    mailx \
    busybox-extras \
    ssmtp \
    vim \
    redis

COPY curltime /usr/local/bin/curltime

RUN chmod +x /usr/local/bin/curltime
