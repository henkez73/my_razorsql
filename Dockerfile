FROM jlesage/baseimage-gui:alpine-3.20-v4

LABEL maintainer="henk.wobbes(at)gmail.com"
ARG version=10_6_3

RUN apk add --no-cache openjdk8-jre unzip libxi libxrender libxtst libxft

WORKDIR /opt
RUN wget "https://s3.dualstack.us-east-1.amazonaws.com/downloads.razorsql.com/downloads/"$version"/razorsql"$version"_linux_x64.zip" \
    && unzip "razorsql"$version"_linux_x64.zip" \
    && rm -rf "razorsql"$version"_linux_x64.zip" \
    && chmod 755 /opt/razorsql/razorsql.sh

ENV HOME /root
WORKDIR /root

COPY startapp.sh /startapp.sh
RUN set-cont-env APP_NAME "razorsql"
