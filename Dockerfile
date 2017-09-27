FROM alpine:latest
RUN apk add --update --no-cache curl gcc musl-dev make

# Install msmtp
RUN set -x \
    && cd /tmp \
    && curl -sSL -o msmtp.tar https://sourceforge.net/projects/msmtp/files/latest/download?source=files \
    && tar -xvf msmtp.tar \
    && cd msmtp-1.6.6 \
    && ./configure --prefix=/usr/local/msmtp \
    && make \
    && make install \
    && rm -rf /tmp/msmtp-1.6.6 msmtp.tar \
    && touch /var/log/msmtp.log \
    && chmod 777 /var/log/msmtp.log