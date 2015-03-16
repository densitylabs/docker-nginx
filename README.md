
This is an ubuntu based nginx image that allows you to a reverse proxy setup.

You can run this image with:

```
docker run -d -p 80:80 -v sites/:/etc/nginx/sites-enabled nginx
```


# Sites template

I'm using a simple template engine with bash, so you need to write the env variables and bash will replace it with the values. you can set `VERBOSE_TEMPLATES` to debug the templates.

Also you need to escape any `$` character with `\$`
