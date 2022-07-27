# livy-conf ODP

```bash
yum install livy2_3_2_2_0_1-0.7.1-1 git

useradd livy -g hadoop
mkdir /var/log/livy2 /var/run/livy2
chown livy:hadoop /var/log/livy2
chown livy:hadoop /var/run/livy2

cd /tmp
git clone https://github.com/bhagadepravin/livy-conf.git
cp * /etc/livy2/conf/
chown livy:hadoop /etc/livy2/conf/*

sudo -u livy bash
/usr/odp/3.2.2.0-1/livy2/bin/livy-server start
```

```
Add proxy user in custom core-site.xml in Ambari UI:

hadoop.proxyuser.livy.groups=*
hadoop.proxyuser.livy.hosts=*
```

```
$ /usr/odp/3.2.2.0-1/livy2/bin/livy-server start
starting /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.332.b09-1.el7_9.x86_64/jre/bin/java -Xmx2g -cp /usr/odp/3.2.2.0-1/livy2/jars/*:/usr/odp/3.2.2.0-1/livy2/conf:/etc/spark2/conf:/etc/hadoop/conf: org.apache.livy.server.LivyServer, logging to /var/log/livy2/livy-livy-server.out

```

##### Known issues/error while insatalling
```bash
22/07/27 10:45:18 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Exception in thread "LeakedAppsGCThread" java.lang.NoClassDefFoundError: com/sun/jersey/core/util/FeaturesAndProperties
	at java.lang.ClassLoader.defineClass1(Native Method)
	at java.lang.ClassLoader.defineClass(ClassLoader.java:756)
	at java.security.SecureClassLoader.defineClass(SecureClassLoader.java:142)
	at java.net.URLClassLoader.defineClass(URLClassLoader.java:473)
	at java.net.URLClassLoader.access$100(URLClassLoader.java:74)
	at java.net.URLClassLoader$1.run(URLClassLoader.java:369)
	at java.net.URLClassLoader$1.run(URLClassLoader.java:363)
	at java.security.AccessController.doPrivileged(Native Method)
	at java.net.URLClassLoader.findClass(URLClassLoader.java:362)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:418)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:352)

[root@mstr3 conf]# ll /usr/odp/3.2.2.0-1/livy2/jars/jersey-*
-rw-r--r--. 1 root root 130458 Feb  4  2021 /usr/odp/3.2.2.0-1/livy2/jars/jersey-client-1.9.jar
-rw-r--r--. 1 root root 715923 Feb  4  2021 /usr/odp/3.2.2.0-1/livy2/jars/jersey-common-2.25.1.jar
-rw-r--r--. 1 root root 971309 Feb  4  2021 /usr/odp/3.2.2.0-1/livy2/jars/jersey-guava-2.25.1.jar



[root@mstr3 conf]# ll /usr/odp/3.2.2.0-1/hadoop/lib/jersey-*
-rw-r--r--. 1 root root 436689 Jun  6 14:06 /usr/odp/3.2.2.0-1/hadoop/lib/jersey-core-1.19.jar
-rw-r--r--. 1 root root 165345 Jun  6 14:06 /usr/odp/3.2.2.0-1/hadoop/lib/jersey-json-1.19.jar
-rw-r--r--. 1 root root 702882 Jun  6 14:06 /usr/odp/3.2.2.0-1/hadoop/lib/jersey-server-1.19.jar
-rw-r--r--. 1 root root 128719 Jun  6 14:06 /usr/odp/3.2.2.0-1/hadoop/lib/jersey-servlet-1.19.jar

$ cp /usr/odp/3.2.2.0-1/hadoop/lib/jersey-* /usr/odp/3.2.2.0-1/livy2/jars/
```

```bash
sudo -u hdfs bash
hdfs dfs -put /usr/odp/current/spark2-client/examples/jars/spark-examples_2.11-2.4.8.3.2.2.0-1.jar /tmp
exit

sudo -u livy bash
$ curl -k  -H "Content-Type: application/json" -X POST -d '{ "file":"/tmp/spark-examples_2.11-2.4.8.3.2.2.0-1.jar", "className":"org.apache.spark.examples.SparkPi" }' 'http://mstr3.odp.centos7.adsre:8998/batches' -H "X-Requested-By: livy"

```
