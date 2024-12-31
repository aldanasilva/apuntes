
# Docker images

## Postgres image
https://hub.docker.com/_/postgres

## PgAdmin4 image
https://hub.docker.com/r/dpage/pgadmin4

## To set up in terminal

```console
$ sudo chown -R 5050:5050 ~/docker/pgadmin
```

https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html#mapped-files-and-directories

## Open PgAdmin4

to run tools

```console
$ docker compose up -d
```

localhost:80

Configs

* PgAdmin4
    * Username: user@domain.com
    * Password: secret
* Postgres
    * General:
        * Name: postgres
    * Connection:
        * Host name/address: postgres
        * Username: postgres
        * Password: secret







