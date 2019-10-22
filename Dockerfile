FROM openjdk:7-jre
LABEL maintainer="henk.wobbes(at)gmail.com"

WORKDIR /opt
RUN wget https://s3.amazonaws.com/downloads.razorsql.com/downloads/8_5_1/razorsql8_5_1_linux_x64.zip \
    && unzip razorsql8_5_1_linux_x64.zip \
    && rm -rf razorsql8_5_1_linux_x64.zip \
    && chmod 755 /opt/razorsql/razorsql.sh \
    && mkdir -p /home/developer \
    && echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd \
    && echo "developer:x:1000:" >> /etc/group \
    && chown developer:developer -R /home/developer
USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD /opt/razorsql/razorsql.sh
