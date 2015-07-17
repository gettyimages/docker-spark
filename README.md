# Standalone Spark-cluster on Docker

A `debian:jessie` based [Spark](http://spark.apache.org) container. Use it in a standalone cluster with the accompanying `docker-compose.yml`, or as a base for more complex recipes.

## Usage

The docker-compose contains three configurations: `master`, `worker` and `task`. Where `master` is the master-node which delegates the task over the worker nodes. The `worker` which gets work assignd from the master and does the actual processing. At last the `task` which solely submits a task to the cluster.

To create a standalone cluster with [docker-compose](http://docs.docker.com/compose):

    docker-compose up

Which will start up the cluster and process the example task, once finished it will shut the cluster down. If you want to continue use the cluster, please add the `-d` argument to daemonize the containers. Scaling can be done using docker-compose:

	docker-compose scale worker=4

The SparkUI will be running at `http://${YOUR_DOCKER_HOST}:8080` with one worker listed. To run `spark-shell`, exec into a container:

    docker exec -it dockerspark_master_1 /bin/bash
    /usr/spark/bin/spark-shell --master spark://master:7077

To run `SparkPi`, exec into a container:

    docker exec -it dockerspark_master_1 /bin/bash
    MASTER=spark://master:7077 /usr/spark/bin/run-example SparkPi 10

## license

MIT
