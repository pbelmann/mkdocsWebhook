FROM python:3.5
ENV WEBHOOK_URL_PREFIX="wiki/hooks"
RUN apt update
RUN apt install -y unzip apache2 build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info
RUN python -m pip  install mkdocs==1.0.4 mkdocs-material==3.1.0 pygments pymdown-extensions mkdocs-pdf-export-plugin==0.4.0
RUN wget -qO- https://github.com/adnanh/webhook/releases/download/2.6.5/webhook-linux-amd64.tar.gz \ 
      | tar xzv --strip 1  -C  /usr/local/bin
RUN mkdir -p /var/webhook /srv_root/docs 
ADD update.sh /usr/local/bin/update.sh
COPY config/hooks.json /usr/local/bin/hooks.json
ADD start.sh /usr/local/bin/start.sh
RUN mkdir /var/www/html/wiki
ENTRYPOINT "start.sh"
