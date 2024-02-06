# [luisnabais/bind9](https://github.com/luisnabais/bind9)

This code consists on the following:
- Dockerfile, to build the image. Based on the official Alpine image.

## Supported Architectures
It should support most architectures, however, I just built it for arm64v8 and amd64.

## Usage
Here are some example snippets to help you get started creating a container.

### docker-compose (recommended, [click here for more info](https://docs.linuxserver.io/general/docker-compose))

```yaml
---
version: '3'
services:
  bind9:
    image: luisnabais/bind9:latest
    container_name: bind9
    hostname: bind9
    environment:
      - TZ=Europe/Lisbon
    volumes:
      - /data/docker/volumes/bind9_config/named.conf:/etc/bind/named.conf
      - /data/docker/volumes/bind9_config/db.home.conf:/etc/bind/zones/db.home.conf
      - /data/docker/volumes/bind9_config/db.vpn.conf:/etc/bind/zones/db.vpn.conf
    ports:
      - 53:53
      - 53:53/udp
    restart: unless-stopped
```

### docker cli ([click here for more info](https://docs.docker.com/engine/reference/commandline/cli/))

```bash
docker run -d \
  --name=bind9 \
  -e TZ=Europe/Lisbon \
  -p 53:53 \
  -p 53:53/udp \
  --restart unless-stopped \
  luisnabais/bind9:latest
```

## Updating Info

Below are the instructions for updating containers:

### Via Docker Compose

* Update all images: `docker-compose pull`
  * or update a single image: `docker-compose pull bind9`
* Let compose update all containers as necessary: `docker-compose up -d`
  * or update a single container: `docker-compose up -d bind9`

### Via Docker Run

* Update the image: `docker pull luisnabais/bind9:latest`
* Stop the running container: `docker stop bind9`
* Delete the container: `docker rm bind9`
* Recreate a new container with the same docker run parameters as instructed above.

* You can also remove the old dangling images: `docker image prune`

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:

```bash
git clone https://github.com/luisnabais/bind9.git
cd bind9
docker build \
  --no-cache \
  --pull \
  -t luisnabais/bind9:latest .
```
