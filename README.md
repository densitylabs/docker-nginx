
This is an ubuntu based nginx image that allows you to a reverse proxy setup.

You can run this image with:

```
docker run -d -p 80:80 -v sites/:/etc/nginx/sites-enabled nginx
```
