FROM debian:10-slim

ARG HUGO_VERSION
ARG HUGO_NAME
ARG HUGO_URL

WORKDIR /hugo
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    git \
    ca-certificates \
    && wget "${HUGO_URL}" \
    && tar -C /usr/bin/ -xzf "${HUGO_NAME}.tar.gz" \
    && rm "${HUGO_NAME}.tar.gz" \
    && apt-get remove -y wget \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \