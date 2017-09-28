FROM python:3.5
RUN apt update
RUN apt install -y unzip
RUN python -m pip  install mkdocs
RUN wget https://github.com/adnanh/webhook/releases/download/2.6.5/webhook-linux-amd64.tar.gz
RUN tar xzvf webhook-linux-amd64.tar.gz
RUN mv /webhook-linux-amd64/webhook /usr/local/bin/
RUN mkdir /var/webhook
RUN mkdir -p /srv_root/docs
RUN mkdir /srv_root/wiki
ADD update.sh /usr/local/bin/update.sh
ADD hooks.json /usr/local/bin/hooks.json
ADD start.sh /usr/local/bin/start.sh
ADD config.yml /usr/local/bin/config.yml
ENTRYPOINT "start.sh"
