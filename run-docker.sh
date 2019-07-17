#!/bin/sh
# set -o errexit
set -o nounset

docker pull warrior7089/rabbitmq:1.0
docker swarm init
docker stack deploy -c docker-compose.yml rab
docker exec -i $(docker ps -q -f 'name=rab_rabbitmq') /bin/bash -c 'echo -e $RABBITMQ_ERLANG_COOKIE > /var/lib/rabbitmq/.erlang.cookie'
docker exec -i $(docker ps -q -f 'name=rab_rabbitmq') /bin/bash -c 'chmod 600 /var/lib/rabbitmq/.erlang.cookie'
# docker exec -i $(docker ps -q -f 'name=rab_rabbitmq') /usr/bin/pkill sleep
sleep 5
docker exec -i $(docker ps -q -f 'name=rab_rabbitmq') rabbitmq-plugins enable rabbitmq_management
