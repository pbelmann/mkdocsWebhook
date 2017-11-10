FROM python:3.5
RUN apt update
RUN apt install -y unzip apache2
RUN python -m pip  install mkdocs==0.16.0 mkdocs-bootstrap==0.1.1
RUN wget -qO- https://github.com/adnanh/webhook/releases/download/2.6.5/webhook-linux-amd64.tar.gz \ 
      | tar xzv --strip 1  -C  /usr/local/bin
RUN mkdir -p /var/webhook /srv_root/docs /srv_root/wiki
ADD update.sh /usr/local/bin/update.sh
ADD hooks.json /usr/local/bin/hooks.json
ADD start.sh /usr/local/bin/start.sh
ADD config.yml /usr/local/bin/config.yml
ENTRYPOINT "start.sh"
