# Docker version 1.13.0
#
# Depending on your system you  may need to prefix the commands below with sudo.
#
# To build:  docker build --force-rm=true -t json-server:0.0.1 .
# To tag as latest:   docker tag json-server:0.0.1 json-server:latest
# To run:   docker run -d -p 3000:3000 --name json-server json-server:latest

FROM gliderlabs/alpine:edge
MAINTAINER Jeffrey Gilbert <jgilber@costco.com>

RUN apk-install nodejs

RUN npm install -g json-server

WORKDIR /home/nodejs/app
ENV NODE_HOME /home/nodejs/app

ADD ./db.json $NODE_HOME

EXPOSE 3000

CMD ["json-server", "--watch", "db.json"]
