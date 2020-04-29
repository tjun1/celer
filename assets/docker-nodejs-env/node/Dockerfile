FROM node:lts-buster

RUN apt update && apt install -y sudo
ENV NODE_ENV=development
RUN npm install -g javascript-typescript-langserver typescript
RUN npm install -g express-generator

# add sudo user
# RUN groupadd -g 1000 developer && \
#     useradd -g developer -G sudo -m -s /bin/bash tjun1 && \
#     echo 'tjun1:password' | chpasswd
RUN echo 'node:password' | chpasswd
RUN echo 'Defaults visiblepw' >> /etc/sudoers
RUN echo 'node ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir /usr/local/app && chown -R node.node /usr/local/app
USER node
WORKDIR /usr/local/app
EXPOSE 3000
