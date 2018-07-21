FROM fedora:28

RUN dnf -y update && dnf -y install \
    wget \
    git \
    gcc \
    gcc-c++ \
    autoconf \
    make \
    cmake \
    python-lxml \
    cpio \
    elfutils-libelf-devel \
    findutils \
    kmod \
&& dnf clean all

WORKDIR /build

# Use the same directory structure as the jenkins worker
RUN mkdir -p sysdig/scripts
ADD script/kernel-crawler.py sysdig/scripts/
ADD script/build-probe-binaries sysdig/scripts/

WORKDIR probe
