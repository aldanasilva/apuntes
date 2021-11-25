## Useful commands for `docker`

This is a short list of commands and options for each command, to get a full list of commands use `docker --help`, to get a full list of options for a command use `docker COMMAND --help`.

* [`docker`](#docker)
  * [`version`](#version)
  * [`info`](#info)
  * [`image pull`](#image-pull)
  * [Running a container](#running-a-container)
    * [`container run`](#container-run)
    * [`container ls`](#container-ls)
    * [`container stop`](#container-stop)
    * [`container start`](#container-start)
  * [Monitoring a container](#monitoring-a-container)
    * [`container logs`](#container-logs)
    * [`container top`](#container-top)
    * [`container inspect`](#container-inspect)
    * [`container stats`](#container-stats)
  * [Getting inside of a container](#getting-inside-of-a-container)
    * [`container exec`](#container-exec)
  * [Networking](#networking)
    * [`container port`](#container-port)
    * [`network ls`](#network-ls)
    * [`network inspect`](#network-inspect)
    * [`network create`](#network-create)
    * [`network connect`](#network-connect)
    * [`network disconnect`](#network-disconnect)
    * [Network Exercises](#network-exercises)



  * [`build`](#build)

# `docker`

A self-sufficient runtime for containers

```console
username@localhost:~$ docker [OPTIONS] COMMAND
```

Options:

```
      --config string      Location of client config files (default "/home/andresaldana/.docker")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
  -v, --version            Print version information and quit
```

Management Commands:

```
  app*        Docker App (Docker Inc., v0.9.1-beta3)
  builder     Manage builds
  config      Manage Docker configs
  container   Manage containers
  image       Manage images
  network     Manage networks
  system      Manage Docker
  volume      Manage volumes
```

Commands:

```
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
```

* An image is the application we want to run
* A container is an instance of that image running as a process
* You can have many containers running of the same image
* Docker's default image "registry" is called Docker Hub ([hub.docker.com])






```
$ docker container logs
$ docker container top CONTAINER
$ docker container rm / Can use first three letters of container id
```

## `version`

Show the Docker version information

```console
$ docker version
```

## `info`

Display system-wide information

```console
$ docker info
```

## `image pull`

Pull an image or a repository from a registry (`docker pull` also works)

```console
$ docker image pull NAME[:TAG]
```

## Running a container

### `container run`

Run a command in a new container (`docker run` also works)

```console
$ docker container run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

Options:

```
      --add-host list                  Add a custom host-to-IP mapping (host:ip)
#  -d, --detach                         Run container in background and print container ID
      --device list                    Add a host device to the container
#  -e, --env list                       Set environment variables
      --env-file list                  Read in a file of environment variables
      --expose list                    Expose a port or a range of ports
  -h, --hostname string                Container host name
#  -i, --interactive                    Keep STDIN open even if not attached
  -l, --label list                     Set meta data on a container
      --mount mount                    Attach a filesystem mount to the container
#      --name string                    Assign a name to the container
#      --network network                Connect a container to a network
#      --network-alias list             Add network-scoped alias for the container
#  -p, --publish list                   Publish a container's port(s) to the host. HOST:CONTAINER format
      --pull string                    Pull image before running ("always"|"missing"|"never") (default "missing")
#      --rm                             Automatically remove the container when it exits
      --stop-timeout int               Timeout (in seconds) to stop a container
#  -t, --tty                            Allocate a pseudo-TTY
  -v, --volume list                    Bind mount a volume
  -w, --workdir string                 Working directory inside the container
```

Examples:

```console
$ docker container run --publish 80:80 nginx
$ docker container run -it --name nginx nginx bash
$ docker container run -it --name ubuntu ubuntu
```

### `container ls`

List containers (`docker ps` also works)

```console
$ docker container ls [OPTIONS]
```

Options:

```
  -a, --all             Show all containers (default shows just running)
  -f, --filter filter   Filter output based on conditions provided
  -n, --last int        Show n last created containers (includes all states) (default -1)
  -l, --latest          Show the latest created container (includes all states)
  -s, --size            Display total file sizes
```

### `container stop`

Stop one or more running containers (`docker stop` also works)

```console
$ docker container stop [OPTIONS] CONTAINER [CONTAINER...]
```

Options:

```
  -t, --time int   Seconds to wait for stop before killing it (default 10)
```

### `container start`

Start one or more stopped containers (`docker start` also works)

```console
$ docker start [OPTIONS] CONTAINER [CONTAINER...]
```

Options:

```
  -a, --attach               Attach STDOUT/STDERR and forward signals
  -i, --interactive          Attach container's STDIN
```

Examples

```console
$ docker container start -ai CONTAINER
```

## Monitoring a container

### `container logs`

Fetch the logs of a container

```console
$ docker container logs [OPTIONS] CONTAINER
```

Options:

```
      --details        Show extra details provided to logs
  -f, --follow         Follow log output
      --since string   Show logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
  -n, --tail string    Number of lines to show from the end of the logs (default "all")
  -t, --timestamps     Show timestamps
      --until string   Show logs before a timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)
```

### `container top`

Display the running processes of a container

```console
$ docker container top CONTAINER
```

### `container inspect`

Display detailed information on one or more containers, show metadata about metadata (startup, config, volumes, networking, etc).

```console
$ docker container inspect [OPTIONS] CONTAINER [CONTAINER...]
```

Options:

```
  -f, --format string   Format the output using the given Go template
  -s, --size            Display total file sizes
```

### `container stats`

Display a live stream of container(s) resource usage statistics

```console
$ docker container stats [OPTIONS] [CONTAINER...]
```

Options:

```
  -a, --all             Show all containers (default shows just running)
      --no-stream       Disable streaming stats and only pull the first result
```

## Getting inside of a container

### `container exec`

Run a command in a running container

```console
$ docker container exec [OPTIONS] CONTAINER COMMAND [ARG...]
```

Options:

```
  -d, --detach               Detached mode: run command in the background
  -e, --env list             Set environment variables
      --env-file list        Read in a file of environment variables
#  -i, --interactive          Keep STDIN open even if not attached
      --privileged           Give extended privileges to the command
#  -t, --tty                  Allocate a pseudo-TTY
  -u, --user string          Username or UID (format: <name|uid>[:<group|gid>])
  -w, --workdir string       Working directory inside the container
```

Read: https://stackoverflow.com/questions/30137135/confused-about-docker-t-option-to-allocate-a-pseudo-tty

Examples:

```console
$ docker container exec -it ANY_CONTAINER bash
$ docker container exec -it MYSQL_CONTAINER mysql -u root -p
```

## Networking

### `container port`

List port mappings or a specific mapping for the container

```console
$ docker container port CONTAINER
```

Another form to do this is using `container inspect`

```console
$ docker container inspect --format '{{ .NetworkSettings.IPAddress}}' CONTAINER
```

### `network ls`

List networks

```console
$ docker network ls [OPTIONS]
```

Options:

```
  -q, --quiet           Only display network IDs
```

Explanation of default existing networks

* `bridge`: Default Docker virtual network, which is NAT'ed behind the Host IP.
* `host`: It gains performance by skipping virtual networks but sacrifices security of container model.
* `none`: Removes eth0 and only leaves you with localhost interface in container.

Network driver: Buil-in or 3rd party extensions that give you virtual network features.

### `network inspect`

Display detailed information on one or more networks

```console
$ docker network inspect NETWORK [NETWORK...]
```

### `network create`

Create a network

```console
$ docker network create [OPTIONS] NETWORK
```

Options:

```
  -d, --driver string        Driver to manage the Network (default "bridge")
```

### `network connect`

Connect a container to a network

```console
$ docker network connect [OPTIONS] NETWORK CONTAINER
```

Options:

```
      --alias strings           Add network-scoped alias for the container
```

### `network disconnect`

Disconnect a container from a network

```console
$ docker network disconnect [OPTIONS] NETWORK CONTAINER
```

Options:

```
  -f, --force   Force the container to disconnect from a network
```

### Network Exercises

1. Connection between two `nginx` containers

```console
$ docker network create my-net
$ docker container run -d --rm --name first_nginx --net my-net nginx:1.21-alpine
$ docker container run -d --rm --name second_nginx --net my-net nginx:1.21-alpine
$ docker container exec -it first_nginx ping second_nginx
$ docker container stop first_nginx second_nginx
$ docker network rm my-net
```

2. Connection to two different `nginx` containers with the same `--net-alias`

```console
$ docker network create my-net
$ docker container run -d --rm --name first_es --net my-net --net-alias search elasticsearch:2
$ docker container run -d --rm --name second_es --net my-net --net-alias search elasticsearch:2
$ docker container run --rm --net my-net alpine:3.10 nslookup search
$ docker container run --rm --net my-net centos:7 curl -s search:9200
$ docker container stop first_es second_es
$ docker network rm my-net
```






## Images

What is an image

* Docker hub
* Official images
  * difference between latest
* How to discern "good" public images
* Using different base inages like Debian or Alpine

Image and they layers

* Images are made up of file system changes and metadata
* Each layer is uniquely identified and only stored once on a host
* This saves storage space on host and transfer time on push/pull
* A container is just a single read/write layer on top of image

Image Tagging and Pushing to Docker Hub

* Properly tagging images
* Tagging images for upload to docker hub
* How tagging is related to image ID
* The `latest` Tag
* Logging into Docker Hub from docker cli
* How to create private Docker Hub images







### `image history`

Show the history of an image

```
$ docker image history [OPTIONS] IMAGE
```

Options:

```
      --no-trunc        Don't truncate output
  -q, --quiet           Only show image IDs
```

### `image inspect`

Display detailed information on one or more images

```console
$ docker image inspect [OPTIONS] IMAGE [IMAGE...]
```

### `image tag`

Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE

```console
$ docker image tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
```

USER/REPO:TAG

Default tag is `latest` if not specified



### `docker login`

Log in to a Docker registry. If no server is specified, the default is defined by the daemon.

```console
$ docker login [OPTIONS] [SERVER]
```

Options:

```
  -p, --password string   Password
  -u, --username string   Username
```

### `docker logout`

Log out from a Docker registry. If no server is specified, the default is defined by the daemon.

```console
$ docker logout [SERVER]
```

### Dockerfile

```Dockerfile
# NOTE: this example is taken from the default Dockerfile for the official nginx Docker Hub Repo
# https://hub.docker.com/_/nginx/
FROM debian:stretch-slim
# all images must have a FROM
# usually from a minimal Linux distribution like debian or (even better) alpine
# if you truly want to start with an empty container, use FROM scratch

ENV NGINX_VERSION 1.13.6-1~stretch
ENV NJS_VERSION   1.13.6.0.1.14-1~stretch
# optional environment variable that's used in later lines and set as envvar when container is running

RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y gnupg1 \
	&& \
	NGINX_GPGKEY=573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62; \
	found=''; \
	for server in \
		ha.pool.sks-keyservers.net \
		hkp://keyserver.ubuntu.com:80 \
		hkp://p80.pool.sks-keyservers.net:80 \
		pgp.mit.edu \
	; do \
		echo "Fetching GPG key $NGINX_GPGKEY from $server"; \
		apt-key adv --keyserver "$server" --keyserver-options timeout=10 --recv-keys "$NGINX_GPGKEY" && found=yes && break; \
	done; \
	test -z "$found" && echo >&2 "error: failed to fetch GPG key $NGINX_GPGKEY" && exit 1; \
	apt-get remove --purge -y gnupg1 && apt-get -y --purge autoremove && rm -rf /var/lib/apt/lists/* \
	&& echo "deb http://nginx.org/packages/mainline/debian/ stretch nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						nginx=${NGINX_VERSION} \
						nginx-module-xslt=${NGINX_VERSION} \
						nginx-module-geoip=${NGINX_VERSION} \
						nginx-module-image-filter=${NGINX_VERSION} \
						nginx-module-njs=${NJS_VERSION} \
						gettext-base \
	&& rm -rf /var/lib/apt/lists/*
# optional commands to run at shell inside container at build time
# this one adds package repo for nginx from nginx.org and installs it

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log
# forward request and error logs to docker log collector

EXPOSE 80 443
# expose these ports on the docker virtual network
# you still need to use -p or -P to open/forward these ports on host

CMD ["nginx", "-g", "daemon off;"]
# required: run this command when container is launched
# only one CMD allowed, so if there are multiple, last one wins
```
Bret Fisher Example







### `image build`

Build an image from a Dockerfile

```console
$ docker image build [OPTIONS] PATH | URL | -
```

Options:

```
      --add-host list           Add a custom host-to-IP mapping (host:ip)
      --build-arg list          Set build-time variables
#  -f, --file string             Name of the Dockerfile (Default is 'PATH/Dockerfile')
      --label list              Set metadata for an image
      --network string          Set the networking mode for the RUN instructions during build (default "default")
      --no-cache                Do not use cache when building the image
      --pull                    Always attempt to pull a newer version of the image
  -q, --quiet                   Suppress the build output and print image ID on success
      --security-opt strings    Security options
#  -t, --tag list                Name and optionally a tag in the 'name:tag' format
      --target string           Set the target build stage to build.
```


### Docker file

Docker can build images automatically by reading the instructions from a **Dockerfile**. A **Dockerfile** is a text document that contains all the commands a user could call on the command line to assemble an image. Using docker build users can create an automated build that executes several command-line instructions in succession.

#### Basic structure of Dockerfile

```Dockerfile
FROM python:3.10-slim
RUN apt-get update && \
    apt-get upgrade -y && \
    pip install --upgrade pip && \
    pip install numpy pandas scipy matplotlib
WORKDIR /app
COPY . .
CMD ["python", "inicio.py"]
```








### Exercises

1. Tagging and pushin an image to **docker hub**

```console
$ docker pull mysql
$ docker image tag mysql MYACCOUNT/mysql
$ docker image push MYACCOUNT/mysql
```

If you get an error doing this, probably you're not logged in in **docker hub**, to do that use `docker login`.






























































































### Linux useful commands

To know linux distro that is running

```console
username@localhost:~$ cat /etc/os-release
```






### Run image of postgres

```console
username@localhost:~$ docker image pull postgres:14.1-alpine
username@localhost:~$ docker container run -d \
    --network my-network --network-alias postgres \
    -v ~/docker/postgres/data:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=secret \
    -p 5432:5432 \
    --name postgres \
    postgres:14.1-alpine
username@localhost:~$ docker ps
```

Note: remember to create the network `my-network`.

###### References:
* https://hub.docker.com/_/postgres
* https://github.com/docker-library/postgres/blob/e331a5bb8dd2494ffd70d67eeca495ace748c8bd/14/alpine/Dockerfile


### Run image of pgadmin4

```console
username@localhost:~$ docker image pull dpage/pgadmin4:6.2
username@localhost:~$ docker container run -d \
    --network my-network --network-alias pgadmin \
    -v ~/docker/pgadmin/data:/var/lib/pgadmin \
    -e PGADMIN_DEFAULT_EMAIL=user@domain.com \
    -e PGADMIN_DEFAULT_PASSWORD=secret \
    -p 80:80 \
    --name pgadmin \
    dpage/pgadmin4:6.2
username@localhost:~$ docker ps
```

Note: remember to create the network `my-network`

###### References:
* https://www.pgadmin.org/download/pgadmin-4-container/
* https://hub.docker.com/r/dpage/pgadmin4/
* https://hub.docker.com/layers/dpage/pgadmin4/6.2/images/sha256-2abd224a4a1821d388920b8a8f99ca4921fc2eb5e640fb569ae1f33e61d2cb7b?context=explore

###### Troubleshooting with volume in host:
* https://www.py4u.net/discuss/1627490
* https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html#mapped-files-and-directories


### View network IPs

You can see containters IPs using netshoot

```console
username@localhost:~$ docker run -it --network my-network nicolaka/netshoot
                    dP            dP                           dP   
                    88            88                           88   
88d888b. .d8888b. d8888P .d8888b. 88d888b. .d8888b. .d8888b. d8888P 
88'  `88 88ooood8   88   Y8ooooo. 88'  `88 88'  `88 88'  `88   88   
88    88 88.  ...   88         88 88    88 88.  .88 88.  .88   88   
dP    dP `88888P'   dP   `88888P' dP    dP `88888P' `88888P'   dP   
                                                                    
Welcome to Netshoot! (github.com/nicolaka/netshoot)
                                                                


 a7663fa9d350  ~  dig postgres

; <<>> DiG 9.16.22 <<>> postgres
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 588
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;postgres.			IN	A

;; ANSWER SECTION:
postgres.		600	IN	A	172.29.0.2

;; Query time: 0 msec
;; SERVER: 127.0.0.11#53(127.0.0.11)
;; WHEN: Mon Nov 22 19:31:27 UTC 2021
;; MSG SIZE  rcvd: 50


 a7663fa9d350  ~  exit
                                                                                                                                                
username@localhost:~$
```




### Postgres and pgAdmin4 with Compose

`docker-compose.yml`
```yml
version: "3.9"

services:
  
  postgres:
    image: postgres:14.1-alpine
    environment:
      POSTGRES_PASSWORD: secret
    networks:
      my-network:
        aliases:
          - postgres
          - db
    ports:
      - "5432:5432"
    volumes:
      - "~/docker/postgres/data:/var/lib/postgresql/data"
    container-name: postgres
    
  pgadmin:
    image: dpage/pgadmin4:6.2
    environment:
      - PGADMIN_DEFAULT_EMAIL=user@domain.com
      - PGADMIN_DEFAULT_PASSWORD=secret
    networks:
      my-network:
        aliases:
          - pgadmin
    ports:
      - "80:80"
    volumes:
      - "~/docker/pgadmin/data:/var/lib/pgadmin"
    depends_on:
      - postgres
    container_name: pgadmin

networks:
  my-network:
    name: my-network
```






/*create table if not exists mytable (
 id int generated always as identity (start 1),
 name varchar(50),
 constraint pk_mytable primary key (id)
);*/

insert into mytable (name)
values ('Andrés');

select *
from mytable
















`ps aux` in Linux show all running proceses





* `nginx`, 80:80
* `mysql`, 3306:3306
* `httpd` (apache) server, 8080:80


curl localhost:8080


$ docker container run -e MYSQL_ROOT_PASSWORD=secret -d mysql
$ 

> exit










```
-t   pseudo-TTY    simulates a real terminal, like what SSH does
-i   interactive   keep session open to recieve terminal input
```







du -sh /




















$ docker container exec -it CONTAINER ping -n OTHER_CONTAINER_IN_NETWORK
















### Exercises of network






```
$ ifconfig INTERFACE
```














