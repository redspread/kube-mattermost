FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget netcat
RUN mkdir -p /mattermost/data

RUN wget https://github.com/mattermost/platform/releases/download/v1.4.0/mattermost.tar.gz \
	&& tar -xvzf mattermost.tar.gz && rm mattermost.tar.gz

COPY config.template.json /
COPY docker-entry.sh /

RUN chmod +x /docker-entry.sh
ENTRYPOINT /docker-entry.sh

RUN rm /mattermost/config/config.json

EXPOSE 80
