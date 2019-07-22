#!/bin/bash

sleep 18000 # 30 mins to allow for smooth restart
exec docker-entrypoint.sh rabbitmq-server