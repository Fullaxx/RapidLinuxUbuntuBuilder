# ------------------------------------------------------------------------------
# Pull base image
FROM ubuntu:focal
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV APTNIR --no-install-recommends
ENV TZ Etc/UTC
ENV LANG C

# ------------------------------------------------------------------------------
# Install the build tools
RUN apt-get update && \
    apt-get install -y ${APTNIR} \
      cpio \
      curlftpfs \
      file \
      git \
      less \
      lsof \
      nano \
      software-properties-common \
      squashfs-tools \
      tree \
      xz-utils && \
    add-apt-repository ppa:brandonsnider/cdrtools && \
    apt-get update && \
    apt-get install -y ${APTNIR} cdrecord mkisofs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Define default command
CMD ["/bin/bash"]
