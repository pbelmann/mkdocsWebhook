FROM python:3.5
ENV WEBHOOK_URL_PREFIX="wiki/hooks"
RUN apt update
RUN apt install -y unzip apache2
RUN python -m pip  install mkdocs==1.0.4 mkdocs-material==3.1.0 pygments pymdown-extensions
RUN wget -qO- https://github.com/adnanh/webhook/releases/download/2.6.5/webhook-linux-amd64.tar.gz \ 
      | tar xzv --strip 1  -C  /usr/local/bin
RUN mkdir -p /var/webhook /srv_root/docs 
ADD update.sh /usr/local/bin/update.sh
COPY config/hooks.json /usr/local/bin/hooks.json
ADD start.sh /usr/local/bin/start.sh
RUN mkdir /var/www/html/wiki
ENTRYPOINT "start.sh"
