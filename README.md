
# spark

A `debian:stretch` based [Spark](http://spark.apache.org) container. Use it in a standalone cluster with the accompanying `docker-compose.yml`, or as a base for more complex recipes.

## docker example

To run `SparkPi`, run the image with Docker:

    docker run --rm -it -p 4040:4040 gettyimages/spark bin/run-example SparkPi 10

To start `spark-shell` with your AWS credentials:

    docker run --rm -it -e "AWS_ACCESS_KEY_ID=YOURKEY" -e "AWS_SECRET_ACCESS_KEY=YOURSECRET" -p 4040:4040 gettyimages/spark bin/spark-shell

To do a thing with Pyspark

    echo -e "import pyspark\n\nprint(pyspark.SparkContext().parallelize(range(0, 10)).count())" > count.py
    docker run --rm -it -p 4040:4040 -v $(pwd)/count.py:/count.py gettyimages/spark bin/spark-submit /count.py

## docker-compose example

To create a simplistic standalone cluster with [docker-compose](http://docs.docker.com/compose):

    docker-compose up

The SparkUI will be running at `http://${YOUR_DOCKER_HOST}:8080` with one worker listed. To run `pyspark`, exec into a container:

    docker exec -it dockerspark_master_1 /bin/bash
    bin/pyspark

To run `SparkPi`, exec into a container:

    docker exec -it dockerspark_master_1 /bin/bash
    bin/run-example SparkPi 10

### Using the history server

Spark comes with an history server, it provides a great UI with many information regarding Spark jobs execution (event timeline, detail of stages, etc.).
Details can be found in the [Spark monitoring page][spark-monit].

With this implementation, its UI will be running at `http://${YOUR_DOCKER_HOST}:18080`.

To use the Spark’s history server you have to tell your Spark driver:

* to log events: `spark.eventLog.enabled true` (it's `false` by default)
* the log directory to use: `spark.eventLog.dir file:/tmp/spark-events`

By default the `/tmp/spark-events` is mounted on the `./spark-events` at the root of the repo (I call it `$DOCKER_SPARK`).
So you have to tell the driver to log events in this directory (on your local machine).

This example shows this configuration for a `spark-submit` (the two `--conf` options): 

    DOCKER_SPARK="/Users/xxxx/Git/docker-spark"

    $SPARK_HOME/bin/spark-submit \
      --class org.apache.spark.examples.SparkPi \
      --master spark://localhost:7077 \
      --conf "spark.eventLog.enabled=true" \
      --conf "spark.eventLog.dir=file:$DOCKER_SPARK/spark-events" \
      $SPARK_HOME/examples/jars/spark-examples_2.11-2.3.1.jar \
      10

*Note: This settings can be defined in the driver's `$SPARK_HOME/conf/spark-defaults.conf` to avoid using the `--conf` option.*

## license

MIT

[spark-monit]: https://spark.apache.org/docs/latest/monitoring.html