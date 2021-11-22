## Useful commands for `docker`

This is a short list of commands and options for each command, to get a full list of commands use `docker --help`, to get a full list of options for a command use `docker COMMAND --help`.

* [`docker`](#docker)
  * [`pull`](#pull)
  * [`run`](#run)
  * [`ps`](#ps)
  * [`exec`](#exec)
  * [`stop`](#stop)
  * [`start`](#start)
  * [`build`](#build)

### `docker`

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



### `pull`

Pull an image or a repository from a registry

```console
username@localhost:~$ docker pull NAME[:TAG|@DIGEST]
```

### `run`

Run a command in a new container

```console
username@localhost:~$ docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

Options:

```
      --add-host list                  Add a custom host-to-IP mapping (host:ip)
  -d, --detach                         Run container in background and print container ID
      --device list                    Add a host device to the container
  -e, --env list                       Set environment variables
      --env-file list                  Read in a file of environment variables
      --expose list                    Expose a port or a range of ports
  -h, --hostname string                Container host name
  -i, --interactive                    Keep STDIN open even if not attached
  -l, --label list                     Set meta data on a container
      --mount mount                    Attach a filesystem mount to the container
      --name string                    Assign a name to the container
      --network network                Connect a container to a network
      --network-alias list             Add network-scoped alias for the container
  -p, --publish list                   Publish a container's port(s) to the host
      --pull string                    Pull image before running ("always"|"missing"|"never") (default "missing")
      --rm                             Automatically remove the container when it exits
      --stop-timeout int               Timeout (in seconds) to stop a container
  -t, --tty                            Allocate a pseudo-TTY
  -v, --volume list                    Bind mount a volume
  -w, --workdir string                 Working directory inside the container
```

### `ps`

List containers

```console
username@localhost:~$ docker ps [OPTIONS]
```

Options:

```
  -a, --all             Show all containers (default shows just running)
  -f, --filter filter   Filter output based on conditions provided
  -n, --last int        Show n last created containers (includes all states) (default -1)
  -l, --latest          Show the latest created container (includes all states)
  -s, --size            Display total file sizes
```

### `exec`

Run a command in a running container

```console
username@localhost:~$ docker exec [OPTIONS] CONTAINER COMMAND [ARG...]
```

Options:

```
  -d, --detach               Detached mode: run command in the background
  -e, --env list             Set environment variables
      --env-file list        Read in a file of environment variables
  -i, --interactive          Keep STDIN open even if not attached
      --privileged           Give extended privileges to the command
  -t, --tty                  Allocate a pseudo-TTY
  -u, --user string          Username or UID (format: <name|uid>[:<group|gid>])
  -w, --workdir string       Working directory inside the container
```

Read: https://stackoverflow.com/questions/30137135/confused-about-docker-t-option-to-allocate-a-pseudo-tty

### `stop`

Stop one or more running containers

```console
username@localhost:~$ docker stop [OPTIONS] CONTAINER [CONTAINER...]
```

Options:

```
  -t, --time int   Seconds to wait for stop before killing it (default 10)
```

### `start`

Start one or more stopped containers

```console
username@localhost:~$ docker start [OPTIONS] CONTAINER [CONTAINER...]
```

Options:

```
  -a, --attach               Attach STDOUT/STDERR and forward signals
      --detach-keys string   Override the key sequence for detaching a container
  -i, --interactive          Attach container's STDIN
```

### `logs`

Fetch the logs of a container

```console
username@localhost:~$ docker logs [OPTIONS] CONTAINER
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


### `build`

Build an image from a Dockerfile

```console
username@localhost:~$ docker build [OPTIONS] PATH | URL | -
```

Options:

```
      --add-host list           Add a custom host-to-IP mapping (host:ip)
      --build-arg list          Set build-time variables
  -f, --file string             Name of the Dockerfile (Default is 'PATH/Dockerfile')
      --label list              Set metadata for an image
      --network string          Set the networking mode for the RUN instructions during build (default "default")
      --no-cache                Do not use cache when building the image
      --pull                    Always attempt to pull a newer version of the image
  -q, --quiet                   Suppress the build output and print image ID on success
      --security-opt strings    Security options
  -t, --tag list                Name and optionally a tag in the 'name:tag' format
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




### Linux useful commands

To know linux distro that is running

```console
username@localhost:~$ cat /etc/os-release
```






### Run image of postgres

```console
username@localhost:~$ docker pull postgres:14.1-alpine
username@localhost:~$ docker run -d \
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
username@localhost:~$ docker pull dpage/pgadmin4:6.2
username@localhost:~$ docker run -d \
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






docker version

docker info











