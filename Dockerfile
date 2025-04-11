FROM debian:stable-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    curl \
    mailutils \
    #bsd-mailx
    # busybox-extras \
    netcat-openbsd \
    telnet \
    wget \
    tcpdump \
    ssmtp \
    vim \
    redis-server \
    git \
    make \
    util-linux
# curltime
COPY curltime /usr/local/bin/curltime
RUN chmod +x /usr/local/bin/curltime
# mongosh
RUN wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | tee /etc/apt/trusted.gpg.d/server-7.0.asc
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list
RUN apt-get update
RUN apt-get install -y mongodb-mongosh

# FROM alpine

# RUN apk update && apk upgrade --no-cache

# RUN apk add --no-cache \
#     curl \
#     mailx \
#     busybox-extras \
#     ssmtp \
#     vim \
#     redis \
#     bash \
#     git \
#     make
# #     mongodb-tools
# # curltime
# COPY curltime /usr/local/bin/curltime
# RUN chmod +x /usr/local/bin/curltime
# # mongosh
# WORKDIR /root
# RUN wget -O mongosh.tgz https://downloads.mongodb.com/compass/mongosh-2.2.5-linux-x64.tgz
# RUN tar -zxvf mongosh.tgz
# RUN rm -f mongosh.tgz
# RUN mv $(ls -1 | egrep -v tgz) mongodir
# WORKDIR /root/mongodir
# RUN chmod +x bin/mongosh
# RUN cp bin/mongosh /usr/local/bin/
# RUN cp bin/mongosh_crypt_v1.so /usr/local/lib/
