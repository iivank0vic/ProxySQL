# ProxySQL 2.0.7 - Centos7

Using Compose is basically a three-step process.

1. Define your app's environment with a `Dockerfile` so it can be
reproduced anywhere.
2. Define the services that make up your app in `docker-compose.yml` so
they can be run together in an isolated environment.
3. Lastly, run `docker-compose up` and Compose will start and run your entire app.

A `docker-compose.yml` looks like this:

    version: "3"
    services:
      onet:
        image: centos7:proxySQL-beta
        hostname: proxysql-beta
        environment:
          - "CLUSTER_IP1=node1"
          - "CLUSTER_IP2=node2"
          - "CLUSTER_IP3=node3"
          - "PROXYSQL_PASSWD=proxy123"
          - "WEBMON_PASSWD=mon123"
          - "PSQLDBS_USER=test"
          - "PSQLDBS_PASSWD=test505"
        restart: always
        ports:
          - "6032:6032"
          - "6033:6033"
          - "6080:6080"
        volumes:
          - "./data/proxysql:/var/lib/proxysql"


For more information about the Compose file, see the
[Compose file reference](https://github.com/docker/docker.github.io/blob/master/compose/compose-file/compose-versioning.md).

Compose has commands for managing the whole lifecycle of your application:

 * Start, stop and rebuild services
 * View the status of running services
 * Stream the log output of running services
 * Run a one-off command on a service

