
This is an ubuntu based nginx image that allows you to do a reverse proxy setup.
I decided to expose all `conf.d` folder so you can have full control of the nginx instance

You can run this image with:

```
docker run -d -p 80:80 -v sites/:/sites nginx
```

Where `sites/*.conf` should have nginx config files.

# Sites template

I'm using a simple template engine with bash, so you need to write the env variables and bash will replace it with the values. you can set `VERBOSE_TEMPLATES` to debug the templates.

Also you need to escape any `$` character with `\$`

# config examples

This is an example of a static website in `sites/default.conf`

```
server {
    listen       $NGINX_PORT;
    server_name  $NGINX_HOST;

    location / {
        root   /sites/default/
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /sites/default/500.html;
    }
}
```

this is an example of a `docker-compose.yml`

```
nginx:
  build: '../docker-nginx'
  volumes:
    - './sites:/sites'
  ports:
    - '80:80'
  environment:
    - NGINX_HOST=example.com
    - NGINX_PORT=80
```
