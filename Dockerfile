FROM ibmjava:8-jre
LABEL maintainer="henk.wobbes(at)gmail.com"
ARG version=10_6_6

RUN apt-get update && apt-get install -y unzip libxi6 libxrender1 libxtst6 libxft2

WORKDIR /opt
RUN wget "https://s3.dualstack.us-east-1.amazonaws.com/downloads.razorsql.com/downloads/"$version"/razorsql"$version"_linux_x64.zip" \
    && unzip "razorsql"$version"_linux_x64.zip" \
    && rm -rf "razorsql"$version"_linux_x64.zip" \
    && chmod 755 /opt/razorsql/razorsql.sh \
    && mkdir -p /home/developer \
    && echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd \
    && echo "developer:x:1000:" >> /etc/group \
    && chown developer:developer -R /home/developer
USER developer
ENV HOME=/home/developer
WORKDIR /home/developer
CMD ["/opt/razorsql/razorsql.sh"]
