
# spark

A `debian:jessie` based [Spark](http://spark.apache.org) container. Use it in a standalone cluster with the accompanying `docker-compose.yml`, or as a base for more complex recipes.

## example

To create a standalone cluster with [docker-compose](http://docs.docker.com/compose):

    docker-compose up

The SparkUI will be running at `http://${YOUR_DOCKER_HOST}:8080` with one worker listed. To run `spark-shell`, exec into a container:

    docker exec -it dockerspark_master_1 /bin/bash
    /usr/spark/bin/spark-shell

To run `SparkPi`, exec into a container:

    docker exec -it dockerspark_master_1 /bin/bash
    /usr/spark/bin/run-example SparkPi 10

## license

MIT
