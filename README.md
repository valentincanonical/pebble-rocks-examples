## pebble

### build pebble

```sh
cd ./
docker build . -t pebble:latest
```

### run pebble

```sh
docker run pebble
```

## NGINX example

### build nginx

**Requires to [build pebble](#build-pebble) first.**

```sh
cd ./nginx/
docker build . -t pebble/nginx:latest
```

### demo: run nginx

```sh
# Run the container in background (-d) with port mapping (-p <local-port>:<container-port>)
docker run -d -p 3000:3000 --name nginx pebble/nginx
# Try it! You should see the NGINX demo index page
curl localhost:3000
# Let's look at Pebble logs
docker logs nginx
# Don't forget to clean...
docker rm -f nginx
# Done!
```
