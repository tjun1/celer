FROM ruby:2.7

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  build-essential \
  ca-certificates \
  nodejs \
  curl \
  wget \
  gnupg \
  gnutls-bin \
  less \
  lsof \
  uuid-dev \
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
  unzip \
  tree \
  software-properties-common

RUN apt-get install -y \
  tzdata \
  && echo "${TZ}" > /etc/timezone \
  &&  rm /etc/localtime \
  && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && dpkg-reconfigure -f nointeractive tzdata

# Ruby
RUN gem install solargraph
RUN echo "export PATH=/usr/local/bundle/bin:$PATH" >> ~/.profile

# Emacs
RUN apt-get install -y emacs-nox
ADD .emacs.d /root/.emacs.d

WORKDIR /app

# Clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
