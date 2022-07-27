
            #!/usr/bin/env bash

            # - SPARK_HOME      Spark which you would like to use in livy
            # - SPARK_CONF_DIR  Directory containing the Spark configuration to use.
            # - HADOOP_CONF_DIR Directory containing the Hadoop / YARN configuration to use.
            # - LIVY_LOG_DIR    Where log files are stored.  (Default: ${LIVY_HOME}/logs)
            # - LIVY_PID_DIR    Where the pid file is stored. (Default: /tmp)
            # - LIVY_SERVER_JAVA_OPTS  Java Opts for running livy server (You can set jvm related setting here, like jvm memory/gc algorithm and etc.)
            export SPARK_HOME=/usr/hdp/current/spark2-client
            export SPARK_CONF_DIR=/etc/spark2/conf
            export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
            export HADOOP_CONF_DIR=/etc/hadoop/conf
            export LIVY_LOG_DIR=/var/log/livy2
            export LIVY_PID_DIR=/var/run/livy2
            export LIVY_SERVER_JAVA_OPTS="-Xmx2g"