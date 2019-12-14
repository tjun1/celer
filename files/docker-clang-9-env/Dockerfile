FROM ubuntu:18.04

ENV TZ Asia/Tokyo
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  xz-utils \
  ca-certificates \
  build-essential \
  curl \
  wget \
  gnupg \
  gnutls-bin \
  libgnutls28-dev \
  less \
  lsof \
  uuid-dev \
  net-tools \
  git \
  apt-utils \
  openssl \
  libssl-dev \
  zlib1g-dev \
  libreadline-dev \
  libyaml-dev \
  libxml2-dev \
  libxslt-dev \
  sqlite3 \
  libsqlite3-dev \
  rng-tools \

  unzip \
  tree \
  software-properties-common

# timezone
RUN apt-get install -y \
  tzdata \
  && echo "${TZ}" > /etc/timezone \
  && rm /etc/localtime \
  && ln -s /usr/shre/zoneinfo/Asia/Tokyo /etc/localtime \
  && dpkg-reconfigure -f nointeractive tzdata

# clang
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key| apt-key add -
RUN apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main"
RUN apt install -y \
  llvm-9 \
  llvm-9-tools \
  llvm-9-dev \
  lldb-9 \
  liblldb-9 \
  liblldb-9-dev \
  python-lldb-9 \
  lld-9 \
  clang-9 \
  clang-tools-9 \
  clang-format-9 \
  clang-tidy-9 \
  clang-9-doc \
  clangd-9 \
  python-clang-9 \
  libc++-9-dev \
  libc++abi-9-dev \
  libclang1-9 \
  libclang-cpp9 \
  pkg-config \
  cmake \
  libtool \
  automake \
  autoconf

# apt-file
RUN apt install -y apt-file && apt-file update

# Emacs
RUN add-apt-repository ppa:kelleyk/emacs && apt-get update
RUN apt-get install -y emacs26-nox
ADD .emacs.d /root/.emacs.d/

# Clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# update-alternatives
ADD update-alternatives-clang-9.sh /tmp/
RUN /tmp/update-alternatives-clang-9.sh

CMD ["bash"]