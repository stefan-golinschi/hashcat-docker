FROM nvidia/cuda:12.1.1-runtime-ubi8

ENV HASHCAT_VERSION 6.2.6

RUN dnf update -y
RUN dnf install -y wget make gcc gcc-c++

RUN mkdir -p /workspace/Downloads
RUN wget -P /workspace/Downloads https://github.com/hashcat/hashcat/archive/refs/tags/v${HASHCAT_VERSION}.tar.gz
RUN tar -C /workspace/Downloads -xf /workspace/Downloads/v${HASHCAT_VERSION}.tar.gz
RUN cd /workspace/Downloads/hashcat-${HASHCAT_VERSION} && make -j$(nproc) && make install

WORKDIR /workspace
ENTRYPOINT [ "/usr/bin/bash" ]
