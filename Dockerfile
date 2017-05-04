FROM colstrom/alpine

ENV GRAFANA_VERSION='2.6.0' \
    GRAFANA_SHA256='4b0d61b42168e8e3368c91c1783908bd23ab07a203d26e9572f855b565e18ac4'

RUN apk add --update-cache openssl \
    && wget -O /tmp/grafana.tar.gz https://grafanarel.s3.amazonaws.com/builds/grafana-${GRAFANA_VERSION}.linux-x64.tar.gz \
    && apk del openssl \
    && echo "${GRAFANA_SHA256}  /tmp/grafana.tar.gz" > /tmp/grafana.sha256 \
    && sha256sum -c /tmp/grafana.sha256 \
    && tar -x -z -f /tmp/grafana.tar.gz -C /tmp/ \
    && mv /tmp/grafana-${GRAFANA_VERSION} /srv \
    && rm /tmp/grafana*

VOLUME ["/srv"]
