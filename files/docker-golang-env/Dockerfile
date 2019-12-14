FROM golang:1.13-buster

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
  && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && dpkg-reconfigure -f nointeractive tzdata

# Emacs
RUN apt-get install -y \
  emacs-nox \
  elpa-use-package \
  elpa-lsp-mode \
  elpa-lsp-ui \
  elpa-go-mode
ADD .emacs.d /root/.emacs.d/

# Golang
WORKDIR /go/src/app
ENV GO111MODULE=on
RUN go get golang.org/x/tools/gopls@latest
RUN go get golang.org/x/tools/cmd/goimports
RUN go get -u github.com/go-delve/delve/cmd/dlv
RUN echo "export GO111MODULE=on" >> ~/.profile
RUN echo "export PATH=$GOPATH/bin:$PATH" >> ~/.profile

# Clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
