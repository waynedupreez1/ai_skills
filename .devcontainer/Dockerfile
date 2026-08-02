FROM ubuntu:24.04

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        locales \
        nano \
        curl \
        git \
        ssh \
        python3-pip \
        ca-certificates \
        build-essential \
        && rm -rf /var/lib/apt/lists/*

# Install Node 24
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
    apt-get install -y nodejs

RUN arch=$(uname -m) && \
    if [ "$arch" = "aarch64" ]; then arch="arm64"; fi && \
    echo "Detected architecture: $arch" && \
    curl -L -o /tmp/xc.tar.gz https://github.com/joerdav/xc/releases/download/v0.9.0/xc_0.9.0_linux_$arch.tar.gz && \
    tar -xzf /tmp/xc.tar.gz -C /usr/local/bin/ && \
    chmod +x /usr/local/bin/xc && \
    xc -complete
