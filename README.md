# Kafka with consul-template


How to run:

```
docker run -d --name kafka -p 9200:9200 -v /home/core/shared/templates/kafka-templates:/templates --label SERVICE_NAME=kafka --dns=172.17.9.101 --dns-search=service.consul stakater/kafka-with-consul-template
```

#### Note:
* The `--dns` option must specify the address of the consul agent, which will be the private IP of the host instance/machine. (usually it can be founded by the `hostname -i` command)
* Provide the volume mapping (`-v`) if you want to use a custom template for kafka. If the one provided in this repo is enough for your use, you can skip this mapping. 


## Sample Template
We have provided a sample template (in the `templates` directory).

To be able to use that template, you must make sure the following preconditions are met:

### Preconditions

#### Consul services:
* You must have atleast 1 `zookeeper` service running registered in consul by the name `zookeeper-2181`

You can run zookeper as follows:
```
docker run -d --name zookeeper --label SERVICE_NAME=zookeeper -p 2181:2181 zookeeper
```
#### Consul Key-Value entries:
1. The host required to tell clients where to find the broker as well as to communicate with the broker itself.

    key: `kafka/advertisedHost`

    Example: `172.17.9.101`

    Usually this would be the private IP of the instance/machine that is running kafka

2. The port for the advertised host.

    key: `kafka/advertisedPort`

    Example: `9200`

    This port must be same as the one exposed during running the docker container
