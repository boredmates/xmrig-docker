FROM alpine:3.20.3 AS builder

LABEL maintainer="Bored Mates Crypto Club <info@boredmates.com>"
LABEL org.opencontainers.image.source="https://github.com/boredmates/xmrig-docker"
LABEL org.opencontainers.image.description="XMRig cryptocurrency miner on Docker or Kubernetes with possibility of dynamic coin switching (depending on pool)"
LABEL org.opencontainers.image.licenses="MIT"

ARG XMRIG_VERSION=6.22.1

RUN apk --no-cache add wget make cmake libstdc++ gcc g++ libuv-dev openssl-dev

RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories; \
    apk --no-cache add hwloc-dev

RUN wget https://github.com/xmrig/xmrig/archive/refs/tags/v${XMRIG_VERSION}.tar.gz; \
    tar -xf v${XMRIG_VERSION}.tar.gz; \
    mv xmrig-${XMRIG_VERSION} /xmrig; \
    cd /xmrig; \
    cmake -DCMAKE_BUILD_TYPE=Release .; \
    make -j $(nproc); \
    rm -rf v${XMRIG_VERSION}.tar.gz; \
    rm -rf /var/lib/apt/lists/*

FROM alpine:3.20.3

COPY --from=builder /xmrig/xmrig /bin/
COPY default_config.json /bin/default_config.json

RUN apk --no-cache add libuv-dev

RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories; \
    echo 'https://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories; \
    apk --no-cache add hwloc-dev msr-tools kmod

ENTRYPOINT ["xmrig"]
CMD ["--config=/bin/default_config.json"]