FROM alpine:3.18

ARG GOOFUZZ_VERSION=1.2.2

RUN apk --no-cache update && \
    apk --no-cache add bash curl zip

ADD https://github.com/m3n0sd0n4ld/GooFuzz/releases/download/${GOOFUZZ_VERSION}/GooFuzz_release_${GOOFUZZ_VERSION}.zip /tmp

WORKDIR /tmp

RUN unzip /tmp/GooFuzz_release_${GOOFUZZ_VERSION}.zip
RUN chmod +x /tmp/GooFuzz_release_${GOOFUZZ_VERSION}/GooFuzz
RUN mv /tmp/GooFuzz_release_${GOOFUZZ_VERSION}/GooFuzz /usr/local/bin
RUN mv /tmp/GooFuzz_release_${GOOFUZZ_VERSION}/wordlists /usr/local/bin
RUN rm -rf /tmp/*

WORKDIR /

CMD ["/bin/bash"]
