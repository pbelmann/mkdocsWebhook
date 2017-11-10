# MkDocs Webhook

## Quickstart

1. Build the image

~~~BASH
docker build -t docs .
~~~

2. Run the image

~~~BASH
docker run -it  -e REPOSITORY=REPOSITORY_URL -p "80:80" -p "9000:9000"  docs
~~~

where 

 * REPOSITORY_URL  must be a link to tar.gz file (e.g: https://github.com/deNBI/cloud-user-docs/archive/master.tar.gz). 
   The GitHub repository must have at its root a config yaml for describing the setup. See https://github.com/deNBI/cloud-user-docs.git as an example.

3. You can now open  "localhost/wiki" in your browser and send request to localhost:9000/wiki/hooks/update to update the pages

## Production

1. Replace hooks.json in order to set the correct hook (e.g.: GitHub webhooks)

2. (Optional) You can change the theme in the config yaml.
