FROM pataquets/ubuntu:xenial

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install wget \
  && \
  . /etc/lsb-release && \
  wget -O /tmp/percona-release.deb \
    https://repo.percona.com/apt/percona-release_0.1-4.${DISTRIB_CODENAME}_all.deb && \
  dpkg -i /tmp/percona-release.deb && \
  rm -v /tmp/percona-release.deb \
  && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y purge wget \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/
